package com.droiduino.forstatementcourse;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Instantiate
        final EditText inputLoop = findViewById(R.id.inputLoop);
        final EditText inputMsg = findViewById(R.id.inputMessage);
        Button buttonClick = findViewById(R.id.buttonClick);

        // Code for button
        buttonClick.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String loopStr = inputLoop.getText().toString();
                int loopInt = Integer.valueOf(loopStr);
                String loopMsg = inputMsg.getText().toString();
                for (int i = 0; i < loopInt; i++){
                    Log.i("Message " + i, loopMsg);
                }
            }
        });
    }
}