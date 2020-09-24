package com.droiduino.companionappexercise;

import androidx.appcompat.app.AppCompatActivity;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class MainActivity extends AppCompatActivity {

    private String deviceAddress = null;
    public static Handler handler;
    public static BluetoothSocket mmSocket;
    public static CreateConnectThread createConnectThread;
    public static ConnectedThread connectedThread;

    private final static int CONNECTION_STATUS = 1;
    private final static int MESSAGE_READ = 2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Instantiate UI
        final TextView bluetoothStatus = findViewById(R.id.textBluetoothStatus);
        Button buttonConnect = findViewById(R.id.buttonConnect);
        Button buttonDisconnect = findViewById(R.id.buttonDisconnect);
        final TextView ledStatus = findViewById(R.id.textLedStatus);
        Button buttonOn = findViewById(R.id.buttonOn);
        Button buttonOff = findViewById(R.id.buttonOff);
        Button buttonBlink = findViewById(R.id.buttonBlink);

        // Code for the "Connect" button
        buttonConnect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, SelectDeviceActivity.class);
                startActivity(intent);
            }
        });

        // Code for the "Disconnect" button
        buttonDisconnect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                createConnectThread.cancel();
                bluetoothStatus.setText("Bluetooth is Disconnected");
            }
        });

        // Get Device Address information
        deviceAddress = getIntent().getStringExtra("deviceAddress");

        // If device Address found
        if (deviceAddress != null){
            bluetoothStatus.setText("Connecting...");
            BluetoothAdapter bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
            createConnectThread = new CreateConnectThread(bluetoothAdapter, deviceAddress);
            createConnectThread.start();
        }

        // Handler Object
        handler = new Handler(Looper.getMainLooper()){

            @Override
            public void handleMessage(Message msg) {
                switch (msg.what) {
                    case CONNECTION_STATUS:
                        switch (msg.arg1){
                            case 1:
                                bluetoothStatus.setText("Bluetooth Connected");
                                break;
                            case -1:
                                bluetoothStatus.setText("Connection Failed");
                                break;
                        }
                        break;

                    // If the message contains data from Arduino board
                    case MESSAGE_READ:
                        String statusText = msg.obj.toString().replace("/n","");
                        ledStatus.setText(statusText);
                        break;
                }
            }
        };

        // Turn On Button
        buttonOn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String androidCmd = "w";
                connectedThread.write(androidCmd);
            }
        });

        // Turn Off Button
        buttonOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String androidCmd = "s";
                connectedThread.write(androidCmd);
            }
        });

        // Blinking Button
        buttonBlink.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String androidCmd = "d";
                connectedThread.write(androidCmd);
            }
        });


    }

    /* ======= Thread 1 ======== */
    public static class CreateConnectThread extends Thread {

        public CreateConnectThread(BluetoothAdapter bluetoothAdapter, String address){

            BluetoothDevice bluetoothDevice = bluetoothAdapter.getRemoteDevice(address);
            BluetoothSocket tmp = null;
            UUID uuid = bluetoothDevice.getUuids()[0].getUuid();
            try {
                tmp = bluetoothDevice.createInsecureRfcommSocketToServiceRecord(uuid);
            } catch (IOException e) {
                Log.e("Error Message", e.toString());
            }
            mmSocket = tmp;
        }

        public void run(){

            BluetoothAdapter bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
            bluetoothAdapter.cancelDiscovery();
            try {
                mmSocket.connect();
                handler.obtainMessage(CONNECTION_STATUS,1,-1).sendToTarget();
            } catch (IOException connectException){
                try {
                    mmSocket.close();
                    handler.obtainMessage(CONNECTION_STATUS,-1,-1).sendToTarget();
                } catch (IOException closeException){}
                return;
            }

            connectedThread = new ConnectedThread(mmSocket);
            connectedThread.run();

        }

        public void cancel(){
            try {
                mmSocket.close();
            } catch (IOException e){}
        }
    }

    /* ============== Thread 2 =========== */
    public static class ConnectedThread extends Thread {
        private final BluetoothSocket mmSocket;
        private final InputStream mmInStream;
        private final OutputStream mmOutStream;

        public ConnectedThread(BluetoothSocket socket){
            mmSocket = socket;
            InputStream tmpIn = null;
            OutputStream tmpOut = null;
            try{
                tmpIn = socket.getInputStream();
                tmpOut = socket.getOutputStream();
            } catch (IOException e){}
            mmInStream = tmpIn;
            mmOutStream = tmpOut;
        }

        public void run(){
            byte[] buffer = new byte[1024];
            int bytes = 0;
            while (true){
                try {
                    buffer[bytes] = (byte) mmInStream.read();
                    String arduinoMsg = null;
                    if (buffer[bytes] == '\n'){
                        arduinoMsg = new String(buffer,0,bytes);
                        handler.obtainMessage(MESSAGE_READ,arduinoMsg).sendToTarget();
                        bytes = 0;
                    } else {
                        bytes++;
                    }
                } catch (IOException e) {
                    break;
                }
            }
        }

        public void write(String input){
            byte[] bytes = input.getBytes();
            try {
                mmOutStream.write(bytes);
            } catch (IOException e){}
        }
    }
}