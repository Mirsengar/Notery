package contagiouscode.mirsengar.notery;

import android.graphics.Typeface;

import android.os.Bundle;
import android.view.MenuItem;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import app.spref;
import fragments.NoteFragment;
import fragments.ProfileFragment;
import fragments.SettingsFragment;

public
class MainActivity extends AppCompatActivity implements BottomNavigationView.OnNavigationItemSelectedListener {
     BottomNavigationView bottomNavigation;
     NoteFragment         noteFragment     = new NoteFragment ( );
     ProfileFragment      profileFragment  = new ProfileFragment ( );
     SettingsFragment     settingsFragment = new SettingsFragment ( );
     public static Typeface font;
     
     @Override
     protected
     void onCreate ( Bundle savedInstanceState ) {
          super.onCreate ( savedInstanceState );
          setContentView ( R.layout.activity_main );
          init ( );
     }
     
     private
     void init ( ) {
          bottomNavigation = findViewById ( R.id.bottomNavigation );
          bottomNavigation.setOnNavigationItemSelectedListener ( this );
          try {
               font = Typeface.createFromAsset ( getAssets ( ) ,
                                                 "fonts/" + spref.get ( ).getString ( "font" ,
                                                                                      "roboto"
                                                                                      + ".ttf" ) );
          }
          catch ( Exception e ) {
          }
          bottomNavigation.setSelectedItemId ( R.id.notes );
          openFragment ( noteFragment );
     }
     
     @Override
     public
     boolean onNavigationItemSelected ( @NonNull MenuItem item ) {
          switch ( item.getItemId ( ) ) {
               case R.id.profile: {
                    openFragment ( profileFragment );
                    break;
               }
               case R.id.notes: {
                    openFragment ( noteFragment );
                    break;
               }
               case R.id.settings: {
                    openFragment ( settingsFragment );
                    break;
               }
          }
          return true;
     }
     
     private
     void openFragment ( Fragment fragment ) {
          FragmentTransaction fragmentTransaction =
                    getSupportFragmentManager ( ).beginTransaction ( );
          fragmentTransaction.replace ( R.id.container , fragment );
          fragmentTransaction.commit ( );
     }
     
     @Override
     public
     void onBackPressed ( ) {
          if ( bottomNavigation.getSelectedItemId ( ) != R.id.notes ) {
               bottomNavigation.setSelectedItemId ( R.id.notes );
          }
          else super.onBackPressed ( );
     }
}