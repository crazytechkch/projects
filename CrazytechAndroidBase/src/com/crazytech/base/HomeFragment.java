package com.crazytech.base;

import android.support.v4.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;

public class HomeFragment extends Fragment {
	
	public HomeFragment(){}
	
	@Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState) {
 
        View rootV = inflater.inflate(R.layout.fragment_home, container, false);
        WebView webV = (WebView)rootV.findViewById(R.id.webv_home);
		webV.getSettings().setSupportZoom(true);
		webV.getSettings().setBuiltInZoomControls(true);
		webV.loadUrl("http://crazytech.co");
        return rootV;
    }
}
