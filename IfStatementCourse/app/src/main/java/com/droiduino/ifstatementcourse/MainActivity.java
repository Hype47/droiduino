package com.droiduino.ifstatementcourse;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Instantiate
        final TextView textView = findViewById(R.id.textStatus);
        final Button button = findViewById(R.id.buttonControl);

        // Default Text
        textView.setText("LED is OFF");
        button.setText("ON");

        // Code for Button
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String textButton = button.getText().toString();
                if (textButton.matches("ON")){
                    textView.setText("LED is ON");
                    button.setText("OFF");
                } else {
                    textView.setText("LED is OFF");
                    button.setText("ON");
                }
            }
        });


    }
}