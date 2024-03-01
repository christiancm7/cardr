import { View, Text, SafeAreaView, Pressable, Button, Alert, Platform } from 'react-native'
import React, { useState, useEffect } from 'react'
import {NativeModules, NativeEventEmitter} from 'react-native';
// import ABC from './CustomModule'
const CounterEvents = new NativeEventEmitter(NativeModules.CarDrSdk);
const App = () => {

let loginresponse = ""
const [deviceId, setDeviceId] = useState('')
const [apiData, setApiData] = useState([]);
useEffect(() => {
  CounterEvents.addListener('scanresponse', result =>

    Alert.alert('Rsult is '+JSON.stringify(result)),
      
    );
    CounterEvents.addListener('loginstatus', result =>
      Alert.alert('Rsult is '+JSON.stringify(result)),
     
    );
    CounterEvents.addListener('scanstart', result =>
      console.log("Console React"+JSON.stringify(result)),
      
     
    );
    CounterEvents.addListener('remainingTime', result =>
  
     setApiData(result),
      
     
    );
    CounterEvents.addListener('scanError', result =>
      
      console.log("Console React"+JSON.stringify(result)),
     
    );

    return () => {
      CounterEvents.removeAllListeners();
    };
}, [])



const Launchsdk = () => {
  NativeModules.CarDrSdk.connectOBD('3003','3003');
}
const AndroidLaunch = () => {
  NativeModules.ToastModule.showToast('Native Kotlin')
}
return (
  <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
    <View>
      
      <Button
  style={{fontSize: 20, color: 'green'}}
  
  onPress={() => NativeModules.CarDrSdk.connectOBD('VOYO_Guest1','guest')}
  title="ConnectOBD"
>
  Press Me
</Button>

 <Button

         color = "red"  
  onPress={() => NativeModules.CarDrSdk.disconnectOBD()}
  title="DisconnectOBD"
>
  Press Me
</Button>
     {/*<Text>{apiData.time} Seconds Remaining</Text>*/}
{apiData.time ? ( 
<Text>
          {apiData.time} Seconds Remaining 
</Text>
      ) : (
<Text>
         Loading data..
</Text>
      )}
      {Platform.OS === 'ios' ?
        <Pressable onPress={Launchsdk}>
          <Text>{this.loginresponse}</Text>
        </Pressable>
        : <Pressable onPress={AndroidLaunch}>
          <Text>Andriod Kotlin</Text>
        </Pressable>
      }
    </View>
  </View>
)
}
export default App