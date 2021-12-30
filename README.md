Samir Online Store     |  Samir Online Store  
:-------------------------:|:-------------------------:
![Screenshot_1640840077](https://user-images.githubusercontent.com/80456446/147722841-4b017869-0a77-4a3c-8030-8f9033e74bdb.png) | ![Screenshot_1640839931](https://user-images.githubusercontent.com/80456446/147722844-b0760a07-7919-4043-8f35-09cc33343720.png)


<h3 align="center">
Samir Online Store 
</h3>


<h1 align="center">
  <img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  /> Samir Online Store Downloadwer<img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />
  </h1>

  <img src="https://user-images.githubusercontent.com/80456446/140654099-49314c9d-1db7-4f7a-be07-3480615c7b54.gif" align="left" width="270" hspace="10" vspace="10">



This is a Flutter Project. Here, sellers can upload a product according to a particular category & brand. Customers can navigate the products using category & brand name just like amazon, flipkart apps. Also, customers can add his/her choiceable products in cart as well as wishlist. After adding to cart, it will be possible in the coming versions to order the products (added in cart) using an online stripe payment method (using Debit / Credit Card). This app has the facility to change light to dark theme or vice-versa. 


  <h3 align="center" >
  <a href="https://drive.google.com/drive/folders/1237c5Uve3TXP0ROo-F7eG_gYc7aJTM3N?usp=sharing">
 <img src="https://user-images.githubusercontent.com/80456446/140654179-eca56dba-e3a6-4076-8625-de71d8a3a249.png" height="60"
         alt="Get it on Android">
 </a>
   </h3>
 </br>



<h1 align="center">
  <img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  /> App Description <img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />
  </h1>
  
  
## Intro Screen Onboarding Flutter 
Flutter Intro Screen Onboarding is a flutter plugin that helps you make a cool intro for your app. Create intro has never been easier and faster


https://user-images.githubusercontent.com/80456446/147720859-54c1349c-d9a5-4248-8ce5-d8fbb4d16677.mp4



screenshot             |  Screenshot
:-------------------------:|:-------------------------: 
![1](https://user-images.githubusercontent.com/80456446/147720696-0442d03a-eae4-4bae-bf4b-620b481de3db.png) | ![2](https://user-images.githubusercontent.com/80456446/147720698-b0522d00-7db8-4e53-b25b-517790100cd2.png)

 Screenshot            | Screenshot
:-------------------------:|:-------------------------: 
![3](https://user-images.githubusercontent.com/80456446/147720701-4116880b-6193-4bc3-bf9e-7b8d3ce47eba.png) | ![3](https://user-images.githubusercontent.com/80456446/147720701-4116880b-6193-4bc3-bf9e-7b8d3ce47eba.png) 




##  Flip Card (sig in/ sign up) 

A component that provides a flip card animation. It could be used for hiding and showing details of a product.

https://user-images.githubusercontent.com/80456446/147721379-e32dcc2f-dff2-459f-8103-d90ef2dba819.mp4





## Teddy log in

<img align="right" src="https://i.imgur.com/hJU9Obt.gif" height="250">

An example built using [JCToon's](https://flare.rive.app/a/JuanCarlos/files/flare/teddy/preview) Flare File as a custom UI component. <br/>
Bear will follow the cursor as you type or move it around.

## Login Page Overview

The basic idea is to use the `ctrl_face` node in JCToon's file to change the direction of Teddy's gaze, as it's shown here in the gif to the right.

This is done by using custom `FlareControls`, available in `/lib/pages/sign_in/bear_log_in_controller.dart`.

`FlareControls` is a custom implementation of the `FlareController` interface. <br/>The interface and can be found in flare_actor.dart and it has three methods:

```
abstract class FlareController {
  void initialize(FlutterActorArtboard artboard);
  void setViewTransform(Mat2D viewTransform);
  bool advance(FlutterActorArtboard artboard, double elapsed);
}
```

<img align="right" src="https://i.imgur.com/WdjurVo.gif" width="300" />

An instance of `BearLogInController` is passed to the `FlareActor` in `/lib/pages/sign_in/sign_in_page.dart`. This ties the controller to this widget, and allows it to use the three overrides to perform custom actions:

```
FlareActor(
    "assets/Teddy.flr",
    controller: _bearLogInController,
    [...]
)
```

In this example, `initialize()` will grab the reference to the `ctrl_face` node through the library call `artboard.getNode("ctrl_face")`.

Moreover, by extending `FlareControls`, `BearLogInController` can take advantage of a concrete implementation of this interface:
- `play(String animationName)`
- `advance(double elapsed)` - a base implementation which advances and mixes multiple animations



## Social Sign in 
Social sign in (google / facebook ) is also allowed 
 Social Sign in            | Social Sign in
:-------------------------:|:-------------------------: 
![Screenshot_1640839851](https://user-images.githubusercontent.com/80456446/147722604-027eae97-207f-4c48-819b-46912eccdc1e.png) | ![Screenshot_1640839816](https://user-images.githubusercontent.com/80456446/147722607-8f996e03-05a8-4611-9a3d-4f66f8b751d2.png)



## About me (info)
Here you can find breif information about me and my contacts
![Screenshot_1640838300](https://user-images.githubusercontent.com/80456446/147721777-23896f4f-40de-4030-80bc-7ec4dee6b9c1.png)


## Social Contacts 
you can find my facebook posts using facebook api token from facebook for developers website. Also you can mail or send me using one of my contacts

Screenshot             |  Screenshot
:------------------------:|:-------------------------: 
![Screenshot_1640838527](https://user-images.githubusercontent.com/80456446/147721782-d4cfa04c-92be-45fd-8912-e1a79d6c8525.png) |![Screenshot_1640838535](https://user-images.githubusercontent.com/80456446/147721784-13711ba7-9206-492c-a163-424fce510e4f.png)

Screenshot             |  Screenshot
:------------------------:|:-------------------------: 
![Screenshot_1640838539](https://user-images.githubusercontent.com/80456446/147721785-298d3d97-40e1-429e-85b6-efd5e1b99093.png) | ![Screenshot_1640838544](https://user-images.githubusercontent.com/80456446/147721786-06d4191c-b387-4501-842b-f51f04b64041.png)


## Online Store Description
This is a Flutter Project. Here, sellers can upload a product according to a particular category & brand. Customers can navigate the products using category & brand name just like amazon, flipkart apps. Also, customers can add his/her choiceable products in cart as well as wishlist. After adding to cart, it will be possible in the coming versions to order the products (added in cart) using an online stripe payment method (using Debit / Credit Card). This app has the facility to change light to dark theme or vice-versa. 

Screenshot             |  Screenshot
:------------------------:|:-------------------------: 
![Screenshot_1640840077](https://user-images.githubusercontent.com/80456446/147722841-4b017869-0a77-4a3c-8030-8f9033e74bdb.png) | ![Screenshot_1640839931](https://user-images.githubusercontent.com/80456446/147722844-b0760a07-7919-4043-8f35-09cc33343720.png)



## Flurry Drawer 
beautiful drawer build with flutter 

https://user-images.githubusercontent.com/80456446/147722964-4bbcf547-47d3-4119-a825-75aebfbbf041.mp4



## Some Screenshots from the store

![Screenshot_1640840596](https://user-images.githubusercontent.com/80456446/147723741-7d222945-175d-4069-8de8-8b3fb9355732.png)

Screenshot             |  Screenshot
:------------------------:|:-------------------------: 
![Screenshot_1640840642](https://user-images.githubusercontent.com/80456446/147723318-381e54fd-0d8f-45e9-b62b-24ad54babd8e.png) | ![Screenshot_1640840646](https://user-images.githubusercontent.com/80456446/147723344-669d37c7-84fe-4d66-a7df-0b235b1ebdab.png)

Screenshot             |  Screenshot
:------------------------:|:-------------------------: 
![Screenshot_1640840650](https://user-images.githubusercontent.com/80456446/147723380-216f264e-9444-4088-add6-c3824de06f8a.png) | ![Screenshot_1640840670](https://user-images.githubusercontent.com/80456446/147723399-5b95c706-ae8d-41be-be3d-d8c3daefcf24.png)




Screenshot             |  Screenshot
:------------------------:|:-------------------------: 
![Screenshot_1640840694](https://user-images.githubusercontent.com/80456446/147723417-99decc8f-95c3-4165-a703-6a89f67c218e.png) | ![Screenshot_1640840702](https://user-images.githubusercontent.com/80456446/147723420-e615a83c-a968-463b-a2c6-76e872370111.png)

Screenshot             |  Screenshot
:------------------------:|:-------------------------: 
![Screenshot_1640840710](https://user-images.githubusercontent.com/80456446/147723422-bc4ecb5e-8bc1-4ed1-94a3-714302b8c462.png) | ![Screenshot_1640840718](https://user-images.githubusercontent.com/80456446/147723423-85fcdcab-c2ff-4f3e-a962-9fa99d7370c6.png)


Screenshot             |  Screenshot
:------------------------:|:-------------------------: 
![Screenshot_1640840723](https://user-images.githubusercontent.com/80456446/147723427-46904654-9f27-4a5b-b91f-967db21e5b7b.png) | ![Screenshot_1640840732](https://user-images.githubusercontent.com/80456446/147723429-6c56b4e3-54f7-4250-96b8-79b8d86cc0c4.png)


Screenshot             |  Screenshot
:------------------------:|:-------------------------: 
![Screenshot_1640840822](https://user-images.githubusercontent.com/80456446/147723431-0076a36a-ba8d-45ab-944b-8053078d9470.png) | ![Screenshot_1640841804](https://user-images.githubusercontent.com/80456446/147723886-f8a6fe2b-563a-4c66-b209-d1badf180945.png)

Screenshot             |  Screenshot
:------------------------:|:-------------------------: 
![Screenshot_1640840829](https://user-images.githubusercontent.com/80456446/147723255-00507d44-f32e-471d-a99c-933248fbf149.png) | ![Screenshot_1640840847](https://user-images.githubusercontent.com/80456446/147723265-e9e089fc-a2e3-4425-99f7-207a417e5cdd.png)


## Feedback Emotions Google Sheet Database
 
 
 New Animated flutter rate UI with animated emotions based on the rate of the user, also it take a written feedack and upload it to google sheet file as shown in the following video.
 

https://user-images.githubusercontent.com/80456446/135735239-53e577c1-a270-4d48-acf9-61ce00c55269.mp4



## google sheet databse

The idea of this project is to upload the feedbacks to google sheet, so in this project we use the google sheet as a databse.

![maxresdefault](https://user-images.githubusercontent.com/80456446/135735384-23955913-1b1d-4302-958f-1e93c5fbef66.jpg)


## App Script 
To open app script, which we will be used to create and deploy api so we can use google sheet as a database. To do this please follow th following steps;

- Open App Script from tools-->Script editor
- write the foolowing .gs code
![image](https://user-images.githubusercontent.com/80456446/135735468-4492ef11-5af9-4f32-a476-6f5fe6476ffa.png)
- open the google sheet acess 
- deploy the app to web app


## Light Mode & Dark Mode
The app supports light and dart mode. The above screenshots were token from the darkmode and the coming screenshots are token from the light mode:
Light Mode Screenshot              | Light Mode Screenshot
:-------------------------:|:-------------------------:
![Screenshot_1640843481](https://user-images.githubusercontent.com/80456446/147725442-797b5af8-b5c1-47d3-9b70-eb30d0dda36c.png) | ![Screenshot_1640843485](https://user-images.githubusercontent.com/80456446/147725449-7707007f-0df6-4f1b-a56d-846c9fc36afa.png)

Light Mode Screenshot              | Light Mode Screenshot
:-------------------------:|:-------------------------:
![Screenshot_1640843490](https://user-images.githubusercontent.com/80456446/147725458-8d19c04f-aa63-4a88-aec9-35d7df3c588e.png) | ![Screenshot_1640843495](https://user-images.githubusercontent.com/80456446/147725462-86aaa5c8-cdf7-4834-a154-7b2f833da6e9.png)


Light Mode Screenshot              | Light Mode Screenshot
:-------------------------:|:-------------------------:
![Screenshot_1640843475](https://user-images.githubusercontent.com/80456446/147725594-40cc43ac-a466-4934-be65-87faa46447fa.png)| ![Screenshot_1640843520](https://user-images.githubusercontent.com/80456446/147725469-92601b27-32a0-49f5-99dd-7fb7186e200c.png)

Light Mode Screenshot              | Light Mode Screenshot
:-------------------------:|:-------------------------:
![Screenshot_1640843529](https://user-images.githubusercontent.com/80456446/147725477-391df4eb-8231-4734-b75b-aaba3e443b9e.png) | ![Screenshot_1640843533](https://user-images.githubusercontent.com/80456446/147725483-fe31d630-707a-4f82-a6b6-9d6bd6b820e6.png)

Light Mode Screenshot              | Light Mode Screenshot
:-------------------------:|:-------------------------:
![Screenshot_1640843460](https://user-images.githubusercontent.com/80456446/147725486-eec26f9f-187a-412d-84d0-22ee4b334d7a.png) | ![Screenshot_1640843466](https://user-images.githubusercontent.com/80456446/147725513-cf0592f5-a228-42ef-91c3-ec01fe142811.png)

Light Mode Screenshot              | Light Mode Screenshot
:-------------------------:|:-------------------------:
![Screenshot_1640843469](https://user-images.githubusercontent.com/80456446/147725535-d0352e8e-b9bd-41c0-8686-d5898ef41459.png)| ![Screenshot_1640843472](https://user-images.githubusercontent.com/80456446/147725587-57617a94-294d-4f10-b442-67c650c15cb9.png)



<h1 align="center">
  <img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />Features aimed to be added in the coming versions<img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />
  </h1>

  <img src="https://user-images.githubusercontent.com/80456446/140655150-3d0e99d9-4293-4f31-8dfb-9aca2a0922c5.gif" align="left" width="270" hspace="10" vspace="10">

This is the version of my app, and it will not be the last and many comming versions will be followed and some of the features which aimed tobe added in the coming versions are :
- Online Payement
- Multiple Language 
- 
<br/>
  <h3 align="center" >
  <a href="https://drive.google.com/drive/folders/1237c5Uve3TXP0ROo-F7eG_gYc7aJTM3N?usp=sharing">
 <img src="https://user-images.githubusercontent.com/80456446/140654179-eca56dba-e3a6-4076-8625-de71d8a3a249.png" height="60"
         alt="Get it on Android">
 </a>
   </h3>
 </br>



<h1 align="center">
  <img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />Sharing the apps<img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />
  </h1>

  <img src="https://user-images.githubusercontent.com/80456446/140656152-1e98e92b-27ef-4140-8696-5dbda6ba6708.gif" align="left" width="270" hspace="10" vspace="10">

please share the app and don't forget to pray for me.
<div display="flex">
  <table width="auto" align="center" >
  <tr>
<td> Vesion </td>
   <td> Link </td>
   <td> State </td>
   </tr>
    <tr>
<td> V0.1 </td>
     <td align="center">
     Tested And Works Fine
     </td>
      <td align="center">
<!-- <br/> -->
  <h3 align="center" >
  <a href="https://drive.google.com/drive/folders/1237c5Uve3TXP0ROo-F7eG_gYc7aJTM3N?usp=sharing">
 <img src="https://user-images.githubusercontent.com/80456446/140654179-eca56dba-e3a6-4076-8625-de71d8a3a249.png" height="60"
         alt="Get it on Android">
 </a>
   </h3>
<!--  </br> -->
   </td>
   </tr>
  </table >
 </div>

<!-- <br/>
  <h3 align="center" >
  <a href="https://drive.google.com/drive/folders/1b_KbBO8K3FYP4Q9wK1Ma-QpmoNOWAqGC?usp=sharing">
 <img src="https://user-images.githubusercontent.com/80456446/140654179-eca56dba-e3a6-4076-8625-de71d8a3a249.png" height="60"
         alt="Get it on Android">
 </a>
   </h3>
 </br> -->




  <br/>  <br/>
<h1 align="center">
  <img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  /> Updating the app<img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />
  </h1>
This is the first version of the app and the app is still under development, so any body notice a bug or have an idea to update the app and make it more useful for more nuber of dtudents pleease contack me and these are my contacts:

 <img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />Reach me at<img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />
 <br/>
  <br/>
<a href="https://www.facebook.com/mohamed.almasri.5686/">
  <img align="left" alt="Mohamed-7018 | Fcebook" width="24px" src="https://github.com/Mohamed-7018/Mohamed-7018/blob/main/assets/facebook.svg"/>
</a>
<a href="https://www.linkedin.com/in/mohamed-samir-9b0b2a203">
  <img align="left" alt="Mohamed-7018 | LinkedIn" width="24px" src="https://github.com/Mohamed-7018/Mohamed-7018/blob/main/assets/linkedin.svg"/>
</a>
<a href="mailto:mohamedkhalilalmasri@gmail.com">
  <img align="left" alt="Mohamed-7018 Esawy | Gmail" width="24px" src="https://user-images.githubusercontent.com/80456446/140469108-1a340307-b696-4f83-bd31-27f632bca393.png" />
</a>
<a href="https://www.hackerrank.com/mohamedkhalilal1">
 <img align="left" alt="HackerRank" width="34px" src="https://upload.wikimedia.org/wikipedia/commons/6/65/HackerRank_logo.png"/>
</a>
<a href="https://www.instagram.com/mohamed_samir_7018/">
 <img align="left" alt="HackerRank" width="34px" src="https://user-images.githubusercontent.com/80456446/140470099-0233261b-373f-43f3-80e4-6be8ff9c9438.png"/>
</a>

<br/>
<br/>





<br/>


  <br/>  <br/>
<h1 align="center">
  <img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />  Just follow☝️ me and Star⭐ my repository<img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />
  </h1>
Make star to my repo and following me in github and different Social Media would help me to continue.

![1_TcdcC2gXNwtnLzsp6GXe1g](https://user-images.githubusercontent.com/80456446/134283879-11c9a3ae-65e4-416e-b3e6-dd8137b991e8.png)


  <br/>  <br/>
<h1 align="center">
  <img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  /> License & Accesability<img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />
  </h1>
* This is the first version of my package  so if you see any problems you're free to open an issue.
* The project is open source and you to help flutter students to use the exixting widgets and screens to build their own projects (if needed), so it is completely free and any one can contact with me any time to get help in the code.

![1200px-Public_Domain_Mark_button svg](https://user-images.githubusercontent.com/80456446/134284403-2e2f001c-0a9e-46f1-8ab4-fb6618c126fc.png)

  <br/>  <br/>
<h1 align="center">
  <img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />Contributing<img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />
  </h1>
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

![28833-team-work](https://user-images.githubusercontent.com/80456446/140656171-709f2ea9-e4b7-4f42-a598-92807ec2884a.gif)


 <br/>  <br/>
<h1 align="center">
  <img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />Thanks For reading<img src="https://user-images.githubusercontent.com/80456446/140647786-f3cc8d5e-2dc2-4ad0-8200-d36f39061763.gif" width="50" height="30"  />
  </h1>

![74797-thank-you-with-confetti](https://user-images.githubusercontent.com/80456446/140656223-3b3f6572-6551-49d7-ae96-8b9e1e940791.gif)

