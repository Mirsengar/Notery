package app;

import android.content.Context;

import es.dmoral.toasty.Toasty;

public
class Application extends android.app.Application {
     private static
     Context context;
     
     @Override
     public
     void onCreate ( ) {
          super.onCreate ( );
          context = this;
          Toasty.Config.getInstance ( )
                       .apply ( );
     }
     
     public static
     Context getContext ( ) {
          return context;
     }
}