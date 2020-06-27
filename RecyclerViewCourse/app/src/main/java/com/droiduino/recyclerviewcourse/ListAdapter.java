package com.droiduino.recyclerviewcourse;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class ListAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private ArrayList<String> deviceList;

    public static class ViewHolder extends RecyclerView.ViewHolder{
        TextView textView;

        public ViewHolder(View view){
            super(view);
            textView = view.findViewById(R.id.textItem);
        }
    }

    public ListAdapter(ArrayList<String> deviceList){
        this.deviceList = deviceList;
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType){
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_layout, parent, false);
        ViewHolder viewHolder = new ViewHolder(view);
        return viewHolder;
    }

    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position){
        // Get content of Device List
        String deviceName = deviceList.get(position);

        // Assign the content to each RecyclerView row
        ViewHolder itemHolder = (ViewHolder) holder;
        itemHolder.textView.setText(deviceName);
    }

    public int getItemCount(){
        int deviceCount = deviceList.size();
        return deviceCount;
    }


}
