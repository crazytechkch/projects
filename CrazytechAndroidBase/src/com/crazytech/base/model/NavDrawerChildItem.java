package com.crazytech.base.model;

import android.support.v4.app.Fragment;

public class NavDrawerChildItem extends NavDrawerItem{

	public NavDrawerChildItem(String title, int icon, Fragment fragment, boolean isCounterVisible,
			String count) {
		super(title, icon,fragment, isCounterVisible, count);
		// TODO Auto-generated constructor stub
	}

	public NavDrawerChildItem(String title, int icon, Fragment fragment) {
		super(title, icon, fragment);
		// TODO Auto-generated constructor stub
	}

}
