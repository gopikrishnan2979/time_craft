import 'package:flutter/material.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  static const String routename = '/settings/terms & condition';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppbarCom(title: 'Terms & Conditions'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, top: 35, bottom: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Terms & Conditions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                  "By downloading or using the app , these terms will automatically apply to you -you should make sure therefore that you read them carefully before using the app.You're not allowed to copy or modify the app, any part of the app, or our trademarks in any way .You're not allowed to attempt to extract the source code of the app, and you also shouldn't try to translate the app into other languages or make derivate versions. The app itself, and all the trademarks, copyright, database rights, and other, intellectual property rights related to it ,still belong to Gopikrishnan Nair S.",
                  style: termstyle()),
              heightedbox(),
              Text(
                "Gopikrishnan Nair S is commited to ensuring that the app is as useful and efficient as possible . For that reason ,we reserve the right to make changes to the app or to charge for its services ,at any time and for any reason .We will never charge you for the app or its services without making it very clear to you exactly what you're paying for.",
                style: termstyle(),
              ),
              heightedbox(),
              Text(
                "The Time Craft app stores and processes personal data that you have provided to us,to provide my Service . it's your responsibility to keep your phone and access to the app secure . We therefore recommend that you do not jailbreak or root your phone, which is the process of removing softwere restrictions and limitaitons imposed by the official operating system of your device . It could make your phone vulnerable to malware/viruses, malcious programs, compromise your phone's security features and it could mean that the Time Craft app won't work properly or at all.",
                style: termstyle(),
              ),
              heightedbox(),
              Text(
                "The app does use third-party services that declare their Terms and Conditions.",
                style: termstyle(),
              ),
              heightedbox(),
              Text(
                "Link to Terms and Conditions of third-party service providers used by the app",
                style: termstyle(),
              ),
              heightedbox(),
              const Row(
                children: [
                  SizedBox(width: 15),
                  Icon(Icons.circle, color: Colors.blue, size: 5),
                  SizedBox(width: 5),
                  Text(
                    "Google Play Services",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 1),
              const Row(
                children: [
                  SizedBox(width: 15),
                  Icon(Icons.circle, color: Colors.blue, size: 5),
                  SizedBox(width: 5),
                  Text(
                    "Facebook",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              heightedbox(),
              Text(
                "you should be aware that there are certain things that Gopikrishnan Nair S will not take responsibility for Certain functions of the app will require the app to have an active internetconnection .The connection can be Wi-Fi or provided by your mobile network provider, but Gopikrishnan Nair S cannot take responsibility for the app not working at full functionality if you don't have access to Wi-Fi and you don't have any of your data allowance left.",
                style: termstyle(),
              ),
              heightedbox(),
              Text(
                "If you're using the app outside of an area with Wi-Fi , you should remember that the terms of the agreement with your mobile network provider will still apply .As a result , you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app,or other third-party charges. In using the app,you're accepting responsibility for any such charges,including roaming data chages if you use the app outside of your home territory (i.e. region or country) without turning off data roaming . If you are not the bill payer for the device on which you're using the app,please be aware that we assume that you have recieved permission from the bill payer for using the app.",
                style: termstyle(),
              ),
              heightedbox(),
              Text(
                "Along the same lines, Gopikrishnan Nair S cannot always take rasponsibility for the way you use the app i.e. You need to make sure that your device stays charged -if it runs out of battery and you can't turn it on to avail the service, Gopikrishnan Nair S cannot accept responsibility.",
                style: termstyle(),
              ),
              heightedbox(),
              Text(
                "With respect to Gopikrishnan Nair S's responsibility for your use of the app,when you're using the app, it's important to bear in mind that although we endeavor to ensure that it is updated and correct at all times ,we do rely on third-parties to provide information to us so that we can make it available to you . Gopikrishnan Nair S accepts no liability for any loss, direct or indirect, you experience as a result of relying wholely on this functionality of the app.",
                style: termstyle(),
              ),
              heightedbox(),
              Text(
                "At some point,we may wish to update the app. The app is currently available on Android -the requirements for the system(and for any additional systems we dicide to extend the availability of the app to )may change,and you'll need to download the updates if you want to keep using the app. Gopikrishnan Nair S does not promise that it will always update the app so that it is relevant to you and/or works with Android version  that you have installed on your device . However, you promise to always accept updates to the application when offered to you ,We may also wish to stop providing the app,and may terminate use of it at any time without giving notice of termination to you . Unless we tell you otherwise ,upon any termination,(a) the rights and liccenses granted to you in these terms will end; (b) you must stop using the app , and (if needed) delete it from your device.",
                style: termstyle(),
              ),
              heightedbox(),
              const Text(
                'Changes to this Terms and Conditions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              heightedbox(),
              Text(
                "I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes.I will notify you of any changes by posting the new Terms and Conditions on this page.",
                style: termstyle(),
              ),
              heightedbox(),
              Text(
                "These terms and conditions are effective as of 2023-04-15",
                style: termstyle(),
              ),
              heightedbox(),
              const Text(
                'Contact Us',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              heightedbox(),
              Text(
                "If you have any question or suggestions about my Terms and Conditions, do not hesitate to contact me at \ngopikrishnan2979@gmail.com",
                style: termstyle(),
              ),
              heightedbox(),
              Text(
                "This Terms and Conditions page was genarated by ",
                style: termstyle(),
              ),
              const Text(
                "App Privacy Policy Generator",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget heightedbox() {
    return const SizedBox(height: 18);
  }

  TextStyle termstyle() {
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  }
}
