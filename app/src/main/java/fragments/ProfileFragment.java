package fragments;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.appcompat.widget.AppCompatEditText;
import androidx.appcompat.widget.AppCompatImageView;
import androidx.appcompat.widget.AppCompatTextView;
import androidx.fragment.app.Fragment;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.request.RequestOptions;

import app.*;
import contagiouscode.mirsengar.notery.LoginActivity;
import contagiouscode.mirsengar.notery.R;

public
class ProfileFragment extends Fragment {
     AppCompatEditText email, fname, lname;
     AppCompatImageView avatar;
     AppCompatTextView  logout;
     
     public
     ProfileFragment ( ) {
          // Required empty public constructor
     }
     
     @Override
     public
     View onCreateView (
               LayoutInflater inflater , ViewGroup container ,
               Bundle savedInstanceState
                       ) {
          View view = inflater.inflate ( R.layout.fragment_profile , container , false );
          return init ( view );
     }
     
     private
     View init ( View view ) {
          email  = view.findViewById ( R.id.email );
          fname  = view.findViewById ( R.id.fname );
          lname  = view.findViewById ( R.id.lname );
          avatar = view.findViewById ( R.id.avatar );
          logout = view.findViewById ( R.id.logout );
          email.setText ( spref.get ( ).getString ( ROUTER.INPUT_EMAIL , "" ) );
          fname.setText ( spref.get ( ).getString ( ROUTER.INPUT_FNAME , "" ) );
          lname.setText ( spref.get ( ).getString ( ROUTER.INPUT_LNAME , "" ) );
          Glide.with ( Application.getContext ( ) )
               .load ( app.main.URL + spref.get ( ).getString ( "image" , "" ) )
               .apply ( new RequestOptions ( )
                                  .placeholder ( R.drawable.ic_person_black_24dp )
                                  .diskCacheStrategy ( DiskCacheStrategy.NONE ) )
               .into ( avatar );
          logout.setOnClickListener ( new View.OnClickListener ( ) {
               @Override
               public
               void onClick ( View view ) {
                    AlertDialog.Builder alert = new AlertDialog.Builder ( getActivity ( ) );
                    alert.setTitle ( "Log Out ?" );
                    alert.setMessage ( "Do you really want to log Out ?" );
                    alert.setNegativeButton ( "Yes" , new DialogInterface.OnClickListener ( ) {
                         @Override
                         public
                         void onClick ( DialogInterface dialogInterface , int i ) {
                              spref.get ( ).edit ( ).clear ( ).apply ( );
                              startActivity ( new Intent ( getActivity ( ) ,
                                                           LoginActivity.class ) );
                              getActivity ( ).finish ( );
                         }
                    } );
                    alert.setPositiveButton ( "No" , null );
                    alert.show ( );
               }
          } );
          return view;
     }
}