package com.crazytech.base;

import java.util.ArrayList;
import java.util.Locale;

import android.app.AlertDialog;
import android.app.Dialog;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Environment;
import android.support.v4.app.ActionBarDrawerToggle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.widget.DrawerLayout;
import android.text.method.LinkMovementMethod;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.Button;
import android.widget.ExpandableListView;
import android.widget.ExpandableListView.OnChildClickListener;
import android.widget.ExpandableListView.OnGroupClickListener;
import android.widget.TextView;

import com.crazytech.android.base.adapter.NavDrawerListAdapter;
import com.crazytech.base.model.NavDrawerChildItem;
import com.crazytech.base.model.NavDrawerGroupItem;
import com.crazytech.util.LocaleUtil;

public class MainActivity extends FragmentActivity {
	private Bundle bundle;
	private DrawerLayout mDrawerLayout;
	private ExpandableListView mDrawerList;
	private ActionBarDrawerToggle mDrawerToggle;
	
	public static final String PACKAGE_NAME = "com.crazytech.base";
	public static final String SD_STORAGE_PATH = Environment.getExternalStorageDirectory().getAbsolutePath()+"/Android/data/"+PACKAGE_NAME+"/";
	public static final String LOC_STORAGE_PATH = Environment.getDataDirectory()+"/data/"+PACKAGE_NAME+"/";
	public static final String OBB_FILE_PATH = Environment.getExternalStorageDirectory()+"/Android/obb/"+PACKAGE_NAME+"/main.1."+PACKAGE_NAME+".obb";
	public static final String OBB_PATH = Environment.getExternalStorageDirectory()+"/Android/obb/"+PACKAGE_NAME;
	private String locale;

	// nav drawer title
	private CharSequence mDrawerTitle;

	// used to store app title
	private CharSequence mTitle;


	private ArrayList<NavDrawerGroupItem> navDrawerItems;
	private NavDrawerListAdapter adapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		locale = getBaseContext().getResources().getConfiguration().locale.toString();
        if (locale!=null)locale = locale.substring(0,2);
        
		mTitle = mDrawerTitle = getTitle();

		// load slide menu items
		// getString(R.string.daily_text) = getResources().getStringArray(R.array.pubs_array);

		

		mDrawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
		mDrawerList = (ExpandableListView) findViewById(R.id.list_slidermenu);

		navDrawerItems = new ArrayList<NavDrawerGroupItem>();

		// adding nav drawer items to array
		// Home
		// List<String> items = getNavItemsTitle();
		navDrawerItems.add(new NavDrawerGroupItem(MainActivity.this, getString(R.string.hello_world), R.drawable.ic_home, new HomeFragment()));
		navDrawerItems.add(new NavDrawerGroupItem(MainActivity.this, getString(R.string.about), R.drawable.ic_about));
		navDrawerItems.add(new NavDrawerGroupItem(MainActivity.this, getString(R.string.language), R.drawable.globe));
		// Recycle the typed array

		mDrawerList.setOnGroupClickListener(navItemGroupClickListerner());
		mDrawerList.setOnChildClickListener(navItemChildClickListener());
		// setting the nav drawer list adapter
		adapter = new NavDrawerListAdapter(getApplicationContext(),
				navDrawerItems);
		mDrawerList.setAdapter(adapter);
		

		// enabling action bar app icon and behaving it as toggle button
		getActionBar().setDisplayHomeAsUpEnabled(true);
		getActionBar().setHomeButtonEnabled(true);

		mDrawerToggle = new ActionBarDrawerToggle(this, mDrawerLayout,
				R.drawable.ic_drawer, //nav menu toggle icon
				R.string.app_name, // nav drawer open - description for accessibility
				R.string.app_name // nav drawer close - description for accessibility
		) {
			public void onDrawerClosed(View view) {
				getActionBar().setTitle(mTitle);
				// calling onPrepareOptionsMenu() to show action bar icons
				invalidateOptionsMenu();
			}

			public void onDrawerOpened(View drawerView) {
				getActionBar().setTitle(mDrawerTitle);
				// calling onPrepareOptionsMenu() to hide action bar icons
				invalidateOptionsMenu();
			}
		};
		mDrawerLayout.setDrawerListener(mDrawerToggle);

		if (savedInstanceState == null) {
			// on first time display view for first nav item
			displayView(0,getString(R.string.hello_world), new HomeFragment());
		}
		bundle = savedInstanceState;
	}

	/**
	 * Slide menu item click listener
	 * */
	private OnGroupClickListener navItemGroupClickListerner() {
		return new OnGroupClickListener() {
			
			@Override
			public boolean onGroupClick(ExpandableListView parent, View v,
					int groupPosition, long id) {
				NavDrawerGroupItem group = navDrawerItems.get(groupPosition);
				String title = group.getTitle();
				Fragment fragment = group.getFragment();
				if (fragment!=null) {
					displayView(0, title, fragment);
				} else if (title.equals(getString(R.string.about)))showAbout(MainActivity.this);
				else if (title.equals(getString(R.string.language)))changeAppLang();
				return false;
			}
		};
	}
	
	private OnChildClickListener navItemChildClickListener() {
		return new OnChildClickListener() {
			
			@Override
			public boolean onChildClick(ExpandableListView parent, View v,
					int groupPosition, int childPosition, long id) {
				NavDrawerChildItem child = navDrawerItems.get(groupPosition).getChilds().get(childPosition);
				String title = child.getTitle();
				Fragment frag = child.getFragment();
				displayView(0, title, frag);
				return false;
			}
		};
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// toggle nav drawer on selecting action bar app icon/title
		if (mDrawerToggle.onOptionsItemSelected(item)) {
			return true;
		}
		// Handle action bar actions click
		switch (item.getItemId()) {
		case R.id.action_settings:
			return true;
		default:
			return super.onOptionsItemSelected(item);
		}
	}

	/* *
	 * Called when invalidateOptionsMenu() is triggered
	 */
	@Override
	public boolean onPrepareOptionsMenu(Menu menu) {
		// if nav drawer is opened, hide the action items
		boolean drawerOpen = mDrawerLayout.isDrawerOpen(mDrawerList);
		menu.findItem(R.id.action_settings).setVisible(!drawerOpen);
		return super.onPrepareOptionsMenu(menu);
	}

	/**
	 * Diplaying fragment view for selected nav drawer list item
	 * */
	private void displayView(int position, String title, Fragment fragment) {
		// update the main content by replacing fragments
		if (title.equals(getString(R.string.about)))showAbout(this);
		else if (title.equals(R.string.language))changeAppLang();
		else if (fragment != null) {
			FragmentManager fragmentManager = getSupportFragmentManager();
			fragmentManager.beginTransaction()
					.replace(R.id.frame_container, fragment).commit();

			// update selected item and title, then close the drawer
			// mDrawerList.setItemChecked(position, true);
			// mDrawerList.setSelection(position);
			setTitle(title);
			mDrawerLayout.closeDrawer(mDrawerList);
		} else {
			// error in creating fragment
			Log.e("MainActivity", "Error in creating fragment");
		}
	}
	
	public void showAbout(Context context){
		final Dialog dialog = new Dialog(context);
		dialog.requestWindowFeature(Window.FEATURE_LEFT_ICON);
		dialog.setContentView(R.layout.dialog_about);
		dialog.setTitle(R.string.about);
		TextView tv = (TextView) dialog.findViewById(R.id.dialog_text);
		tv.setText(R.string.about_content);
		tv.setMovementMethod(LinkMovementMethod.getInstance());
		TextView tvVer = (TextView) dialog.findViewById(R.id.dialog_tv_version);
		try {
			String localVer = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
			tvVer.setText(context.getString(R.string.version)+" : "+localVer);
		} catch (NameNotFoundException e) {
			Log.e("Package Name Error", e.getMessage());
		}
		Button btn = (Button)dialog.findViewById(R.id.dialog_button_dismiss);
		btn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				dialog.dismiss();
			}
		});
		dialog.setFeatureDrawableResource(Window.FEATURE_LEFT_ICON, R.drawable.ic_about);
		dialog.show();
		
	}
	
	private void changeAppLang() {
    	AlertDialog.Builder builder = new AlertDialog.Builder(this);
		builder.setTitle(R.string.language);
		builder.setIcon(getResources().getDrawable(R.drawable.globe));
		final CharSequence[] items = getResources().getStringArray(R.array.applang);
		builder.setItems(items, new DialogInterface.OnClickListener() {
			
			@Override
			public void onClick(DialogInterface dialog, int which) {
				// TODO Auto-generated method stub
				String lang = items[which].toString();
				String locale = new LocaleUtil(MainActivity.this).getLocaleMap().get(lang);
				Configuration config = MainActivity.this.getBaseContext().getResources().getConfiguration();
				config.locale = new Locale(locale);
				MainActivity.this.getBaseContext().getResources().updateConfiguration(config, MainActivity.this.getBaseContext().getResources().getDisplayMetrics());
				MainActivity.this.getApplicationContext().getResources().updateConfiguration(config, MainActivity.this.getBaseContext().getResources().getDisplayMetrics());
				MainActivity.this.getResources().updateConfiguration(config, MainActivity.this.getResources().getDisplayMetrics());
				refresh();
			}
		});
		builder.create().show();
    }
	
	private void refresh() {
        this.finish();
        Intent myIntent = new Intent(this, MainActivity.class);
        this.startActivity(myIntent);
    }

	@Override
	public void setTitle(CharSequence title) {
		mTitle = title;
		getActionBar().setTitle(mTitle);
	}

	/**
	 * When using the ActionBarDrawerToggle, you must call it during
	 * onPostCreate() and onConfigurationChanged()...
	 */

	@Override
	protected void onPostCreate(Bundle savedInstanceState) {
		super.onPostCreate(savedInstanceState);
		// Sync the toggle state after onRestoreInstanceState has occurred.
		mDrawerToggle.syncState();
	}

	@Override
	public void onConfigurationChanged(Configuration newConfig) {
		super.onConfigurationChanged(newConfig);
		// Pass any configuration change to the drawer toggls
		mDrawerToggle.onConfigurationChanged(newConfig);
	}
	
}
