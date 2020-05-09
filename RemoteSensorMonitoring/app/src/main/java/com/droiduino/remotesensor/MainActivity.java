package com.droiduino.remotesensor;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import androidx.appcompat.widget.Toolbar;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // UI Init
        Toolbar toolbar = findViewById(R.id.toolbar);
        Button buttonConnect = findViewById(R.id.buttonConnect);

        // Connect Button
        buttonConnect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // Dialog Alert
                connectionAlert();
            }
        });
    }

    /* ============ Connect Alert ===================== */
    protected void connectionAlert(){
        AlertDialog.Builder alertDialog = new AlertDialog.Builder(this);
        alertDialog.setTitle("Create Bluetooth Connection")
                .setMessage("Please make sure Bluetooth has been activated")
                .setPositiveButton("Continue", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        // Move to adapter list
                        Intent intent = new Intent(MainActivity.this, SelectDeviceActivity.class);
                        startActivity(intent);
                    }
                });
        alertDialog.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) { }
        });
        alertDialog.show();
    }
}
