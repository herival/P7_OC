import { BrowserModule } from '@angular/platform-browser';
import { NgModule, LOCALE_ID } from '@angular/core';
import { registerLocaleData } from '@angular/common';
import * as fr from '@angular/common/locales/fr';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { LoginComponent } from './login/login.component';
import { SignupComponent } from './signup/signup.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HTTP_INTERCEPTORS, HttpClientModule } from '@angular/common/http';
import { AuthInterceptor } from './interceptors/auth-interceptor';
import { ActualityComponent } from './actuality/actuality.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { publishComponent } from './actuality/publish/publish.component';
import { ErrorComponent } from './error/error.component';
import { SettingComponent } from './setting/setting.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    LoginComponent,
    SignupComponent,
    ActualityComponent,
    publishComponent,
    ErrorComponent,
    SettingComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    BrowserAnimationsModule
  ],
  providers: [
    {
    provide: HTTP_INTERCEPTORS, 
    useClass: AuthInterceptor, 
    multi: true,
    },
    {provide: LOCALE_ID, useValue: 'fr-FR'}
],
  bootstrap: [AppComponent]
  
})
export class AppModule { 
  constructor(){
    registerLocaleData(fr.default);
  }
}
