package com.droiduino.companionappcourse;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class ListAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private Context context;
    private List<Object> deviceList;

    public static class ViewHolder extends RecyclerView.ViewHolder {
        TextView textName;

        public ViewHolder(View view){
            super(view);
            textName = view.findViewById(R.id.textItem);
        }
    }

    public ListAdapter(Context context, List<Object> deviceList){
        this.context = context;
        this.deviceList = deviceList;
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType){
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_layout,parent,false);
        ViewHolder viewHolder = new ViewHolder(view);
        return viewHolder;
    }

    public void onBindViewHolder(RecyclerView.ViewHolder holder,int position){
        // Get Device Name and Device Address
        DeviceInfoModel deviceInfoModel = (DeviceInfoModel) deviceList.get(position);
        String deviceName = deviceInfoModel.getDeviceName();
        final String deviceAddress = deviceInfoModel.getDeviceHardwareAddress();

        // Assign Device name to the list
        ViewHolder itemHolder = (ViewHolder) holder;
        itemHolder.textName.setText(deviceName);

        // Return to Main Screen when a device is selected
        // And pass device Address information to create connection
        itemHolder.textName.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(context, MainActivity.class);
                intent.putExtra("deviceAddress",deviceAddress);
                context.startActivity(intent);
            }
        });

    }

    public int getItemCount(){
        int dataCount = deviceList.size();
        return dataCount;
    }




}
