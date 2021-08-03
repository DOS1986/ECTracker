„
MC:\code\c-sharp\src\github.com\DOS1986\ECTracker\Common.Library\CommonBase.cs
	namespace 	
Common
 
. 
Library 
{ 
public 

class 

CommonBase 
: "
INotifyPropertyChanged 4
{ 
public 
event '
PropertyChangedEventHandler 0
PropertyChanged1 @
;@ A
	protected 
void  
RaisePropertyChanged +
(+ ,
string, 2
propertyName3 ?
)? @
{ 	'
PropertyChangedEventHandler '
handler( /
=0 1
PropertyChanged2 A
;A B
if 
( 
handler 
== 
null 
)  
{ 
return 
; 
} $
PropertyChangedEventArgs $
args% )
=* +
new, /$
PropertyChangedEventArgs0 H
(H I
propertyNameI U
)U V
;V W
handler!! 
(!! 
this!! 
,!! 
args!! 
)!! 
;!!  
}"" 	
public&& 
void&& 
Clone&& 
<&& 
T&& 
>&& 
(&& 
T&& 
original&& '
,&&' (
T&&) *
cloneTo&&+ 2
)&&2 3
{'' 	
if(( 
((( 
original(( 
==(( 
null((  
||((! #
cloneTo(($ +
==((, .
null((/ 3
)((3 4
{)) 
return** 
;** 
}++ 
foreach.. 
(.. 
PropertyInfo.. !
prop.." &
in..' )
typeof..* 0
(..0 1
T..1 2
)..2 3
...3 4
GetProperties..4 A
(..A B
BindingFlags..B N
...N O
Public..O U
|..V W
BindingFlags..X d
...d e
Instance..e m
)..m n
)..n o
{// 
var00 
value00 
=00 
prop00  
.00  !
GetValue00! )
(00) *
original00* 2
,002 3
null004 8
)008 9
;009 :
prop11 
.11 
SetValue11 
(11 
cloneTo11 %
,11% &
value11' ,
,11, -
null11. 2
)112 3
;113 4
}22 
}33 	
}55 
}66 ‹
fC:\code\c-sharp\src\github.com\DOS1986\ECTracker\Common.Library\Configuration\ConfigurationSettings.cs
	namespace 	
Common
 
. 
Library 
. 
Configuration &
{ 
public 

class !
ConfigurationSettings &
:' (

CommonBase) 3
{		 
public 
virtual 
void 
LoadSettings (
(( )
)) *
{ 	
} 	
	protected 
T 

GetSetting 
< 
T  
>  !
(! "
string" (
key) ,
,, -
object. 4
defaultValue5 A
)A B
{ 	
var 
value 
= 
System 
. 
Configuration ,
., - 
ConfigurationManager- A
.A B
AppSettingsB M
[M N
keyN Q
]Q R
;R S
var 
ret 
= 
string 
. 
IsNullOrEmpty *
(* +
value+ 0
)0 1
?2 3
(4 5
T5 6
)6 7
defaultValue7 C
:D E
(F G
TG H
)H I
ConvertI P
.P Q

ChangeTypeQ [
([ \
value\ a
,a b
typeofc i
(i j
Tj k
)k l
)l m
;m n
return 
ret 
; 
} 	
} 
} §

^C:\code\c-sharp\src\github.com\DOS1986\ECTracker\Common.Library\Exceptions\ExceptionManager.cs
	namespace 	
Common
 
. 
Library 
. 

Exceptions #
{ 
public 

class 
ExceptionManager !
:" #

CommonBase$ .
{ 
private 
static 
ExceptionManager '
	_instance( 1
;1 2
public

 
static

 
ExceptionManager

 &
Instance

' /
{ 	
get 
=> 
	_instance 
??=  
new! $
ExceptionManager% 5
(5 6
)6 7
;7 8
set 
=> 
	_instance 
= 
value $
;$ %
} 	
public 
virtual 
void 
Publish #
(# $
	Exception$ -
ex. 0
)0 1
{ 	
System 
. 
Diagnostics 
. 
Debug $
.$ %
	WriteLine% .
(. /
ex/ 1
.1 2
ToString2 :
(: ;
); <
)< =
;= >
} 	
} 
} ”
^C:\code\c-sharp\src\github.com\DOS1986\ECTracker\Common.Library\MessageBroker\MessageBroker.cs
	namespace 	
Common
 
. 
Library 
. 
MessageBroker &
{ 
public 

class 
MessageBroker 
{ 
public 
delegate 
void '
MessageReceivedEventHandler 8
(8 9
object9 ?
sender@ F
,F G"
MessageBrokerEventArgsH ^
e_ `
)` a
;a b
public 
event '
MessageReceivedEventHandler 0
MessageReceived1 @
;@ A
private 
static 
MessageBroker $
	_instance% .
;. /
public 
static 
MessageBroker #
Instance$ ,
{ 	
get 
=> 
	_instance 
??=  
new! $
MessageBroker% 2
(2 3
)3 4
;4 5
set 
=> 
	_instance 
= 
value $
;$ %
} 	
public## 
void## 
SendMessage## 
(##  
string##  &
messageName##' 2
)##2 3
{$$ 	
SendMessage%% 
(%% 
messageName%% #
,%%# $
null%%% )
)%%) *
;%%* +
}&& 	
public-- 
void-- 
SendMessage-- 
(--  
string--  &
messageName--' 2
,--2 3
object--4 :
payload--; B
)--B C
{.. 	
var// 
arg// 
=// 
new// "
MessageBrokerEventArgs// 0
(//0 1
messageName//1 <
,//< =
payload//> E
)//E F
;//F G 
RaiseMessageReceived11  
(11  !
arg11! $
)11$ %
;11% &
}22 	
	protected:: 
void::  
RaiseMessageReceived:: +
(::+ ,"
MessageBrokerEventArgs::, B
e::C D
)::D E
{;; 	
MessageReceived<< 
?<< 
.<< 
Invoke<< #
(<<# $
this<<$ (
,<<( )
e<<* +
)<<+ ,
;<<, -
}== 	
}?? 
}@@ ¥

gC:\code\c-sharp\src\github.com\DOS1986\ECTracker\Common.Library\MessageBroker\MessageBrokerEventArgs.cs
	namespace 	
Common
 
. 
Library 
. 
MessageBroker &
{ 
public 

class "
MessageBrokerEventArgs '
:( )
	EventArgs* 3
{ 
public "
MessageBrokerEventArgs %
(% &
)& '
:( )
base* .
(. /
)/ 0
{ 	
} 	
public "
MessageBrokerEventArgs %
(% &
string& ,
messageName- 8
,8 9
object: @
payloadA H
)H I
:J K
baseL P
(P Q
)Q R
{ 	
MessageName 
= 
messageName %
;% &
MessagePayload 
= 
payload $
;$ %
} 	
public 
string 
MessageName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public## 
object## 
MessagePayload## $
{##% &
get##' *
;##* +
set##, /
;##/ 0
}##1 2
}%% 
}&& ¬
fC:\code\c-sharp\src\github.com\DOS1986\ECTracker\Common.Library\MessageBroker\MessageBrokerMessages.cs
	namespace 	
Common
 
. 
Library 
. 
MessageBroker &
{ 
public 

static 
class !
MessageBrokerMessages -
{ 
public 
const 
string  
DisplayStatusMessage 0
=1 2
$str3 I
;I J
public 
const 
string %
DisplayTimeoutInfoMessage 5
=6 7
$str8 S
;S T
public 
const 
string *
DisplayTimeoutInfoMessageTitle :
=; <
$str= ]
;] ^
public

 
const

 
string

 
CloseUserControl

 ,
=

- .
$str

/ A
;

A B
public 
const 
string 
OpenUserControl +
=, -
$str. ?
;? @
public 
const 
string 
LoginSuccess (
=) *
$str+ 9
;9 :
public 
const 
string 
	LoginFail %
=& '
$str( 3
;3 4
public 
const 
string 
Logout "
=# $
$str% -
;- .
} 
} ä
OC:\code\c-sharp\src\github.com\DOS1986\ECTracker\Common.Library\StringHelper.cs
	namespace 	
Common
 
. 
Library 
{ 
public 

class 
StringHelper 
{		 
public 
static 
string 
CreateRandomString /
(/ 0
int0 3
	maxLength4 =
)= >
{ 	
const 
string 
charList !
=" #
$str$ g
;g h
var 
sb 
= 
new 
StringBuilder &
(& '
$num' )
)) *
;* +
using 
var 
csp 
= 
new $
RNGCryptoServiceProvider  8
(8 9
)9 :
;: ;
var 
buffer 
= 
new 
byte !
[! "
sizeof" (
(( )
uint) -
)- .
]. /
;/ 0
for 
( 
var 
i 
= 
	maxLength "
;" #
i$ %
>& '
$num( )
;) *
i+ ,
--, .
). /
{ 
csp 
. 
GetBytes 
( 
buffer #
)# $
;$ %
var 
num 
= 
BitConverter &
.& '
ToUInt32' /
(/ 0
buffer0 6
,6 7
$num8 9
)9 :
;: ;
sb 
. 
Append 
( 
charList "
[" #
(# $
int$ '
)' (
(( )
num) ,
%- .
(/ 0
uint0 4
)4 5
charList5 =
.= >
Length> D
)D E
]E F
)F G
;G H
} 
return 
sb 
. 
ToString 
( 
)  
;  !
} 	
public&& 
static&& 
bool&& 
IsValidEmail&& '
(&&' (
string&&( .
email&&/ 4
)&&4 5
{'' 	
return(( 
Regex(( 
.(( 
IsMatch((  
(((  !
email((! &
,((& '
(((( )
$str	(() ê
)
((ê ë
)
((ë í
;
((í ì
})) 	
public11 
static11 
bool11 
IsAllLowerCase11 )
(11) *
string11* 0
value111 6
)116 7
{22 	
return33 
new33 
Regex33 
(33 
$str33 +
)33+ ,
.33, -
IsMatch33- 4
(334 5
value335 :
)33: ;
;33; <
}44 	
public;; 
static;; 
bool;; 
IsAllUpperCase;; )
(;;) *
string;;* 0
value;;1 6
);;6 7
{<< 	
return== 
new== 
Regex== 
(== 
$str== +
)==+ ,
.==, -
IsMatch==- 4
(==4 5
value==5 :
)==: ;
;==; <
}>> 	
}?? 
}@@ ö

_C:\code\c-sharp\src\github.com\DOS1986\ECTracker\Common.Library\Validation\ValidationMessage.cs
	namespace 	
Common
 
. 
Library 
. 

Validation #
{ 
public 

class 
ValidationMessage "
:# $

CommonBase% /
{ 
private 
string 
_propertyName $
;$ %
private 
string 
_message 
;  
public 
string 
PropertyName "
{ 	
get 
=> 
_propertyName  
;  !
set 
{ 
_propertyName 
= 
value  %
;% & 
RaisePropertyChanged $
($ %
$str% 3
)3 4
;4 5
} 
} 	
public 
string 
Message 
{ 	
get 
=> 
_message 
; 
set 
{ 
_message 
= 
value  
;  ! 
RaisePropertyChanged $
($ %
$str% .
). /
;/ 0
} 
} 	
} 
}   á
hC:\code\c-sharp\src\github.com\DOS1986\ECTracker\Common.Library\ViewModels\ViewModelAddEditDeleteBase.cs
	namespace 	
Common
 
. 
Library 
. 

ViewModels #
{ 
public 

class &
ViewModelAddEditDeleteBase +
:, -
ViewModelBase. ;
{ 
private 
bool 
_isListEnabled #
=$ %
true& *
;* +
private 
bool 
_isDetailEnabled %
=& '
false( -
;- .
private 
bool 

_isAddMode 
=  !
false" '
;' (
public 
bool 
IsListEnabled !
{ 	
get 
=> 
_isListEnabled !
;! "
set 
{ 
_isListEnabled 
=  
value! &
;& ' 
RaisePropertyChanged $
($ %
$str% 4
)4 5
;5 6
} 
} 	
public 
bool 
IsDetailEnabled #
{ 	
get 
=> 
_isDetailEnabled #
;# $
set 
{ 
_isDetailEnabled  
=! "
value# (
;( ) 
RaisePropertyChanged $
($ %
$str% 6
)6 7
;7 8
} 
} 	
public   
bool   
	IsAddMode   
{!! 	
get"" 
=>"" 

_isAddMode"" 
;"" 
set## 
{$$ 

_isAddMode%% 
=%% 
value%% "
;%%" # 
RaisePropertyChanged&& $
(&&$ %
$str&&% 0
)&&0 1
;&&1 2
}'' 
}(( 	
public,, 
virtual,, 
void,, 
	BeginEdit,, %
(,,% &
bool,,& *
	isAddMode,,+ 4
=,,5 6
false,,7 <
),,< =
{-- 	
IsListEnabled.. 
=.. 
false.. !
;..! "
IsDetailEnabled// 
=// 
true// "
;//" #
	IsAddMode00 
=00 
	isAddMode00 !
;00! "
}11 	
public55 
virtual55 
void55 

CancelEdit55 &
(55& '
)55' (
{66 	
base77 
.77 
Clear77 
(77 
)77 
;77 
IsListEnabled99 
=99 
true99  
;99  !
IsDetailEnabled:: 
=:: 
false:: #
;::# $
	IsAddMode;; 
=;; 
false;; 
;;; 
}<< 	
public@@ 
virtual@@ 
bool@@ 
Save@@  
(@@  !
)@@! "
{AA 	
returnBB 
trueBB 
;BB 
}CC 	
publicGG 
virtualGG 
boolGG 
DeleteGG "
(GG" #
)GG# $
{HH 	
returnII 
trueII 
;II 
}JJ 	
}LL 
}MM ˝ 
[C:\code\c-sharp\src\github.com\DOS1986\ECTracker\Common.Library\ViewModels\ViewModelBase.cs
	namespace 	
Common
 
. 
Library 
. 

ViewModels #
{ 
public		 

class		 
ViewModelBase		 
:		  

CommonBase		! +
{

 
private  
ObservableCollection $
<$ %
ValidationMessage% 6
>6 7
_validationMessages8 K
=L M
newN Q 
ObservableCollectionR f
<f g
ValidationMessageg x
>x y
(y z
)z {
;{ |
private 
bool  
_isValidationVisible )
=* +
false, 1
;1 2
public  
ObservableCollection #
<# $
ValidationMessage$ 5
>5 6
ValidationMessages7 I
{ 	
get 
=> 
_validationMessages &
;& '
set 
{ 
_validationMessages #
=$ %
value& +
;+ , 
RaisePropertyChanged $
($ %
$str% 9
)9 :
;: ;
} 
} 	
public 
bool 
IsValidationVisible '
{ 	
get 
=>  
_isValidationVisible '
;' (
set 
{  
_isValidationVisible   $
=  % &
value  ' ,
;  , - 
RaisePropertyChanged!! $
(!!$ %
$str!!% :
)!!: ;
;!!; <
}"" 
}## 	
public'' 
virtual'' 
void''  
AddValidationMessage'' 0
(''0 1
string''1 7
propertyName''8 D
,''D E
string''F L
msg''M P
)''P Q
{(( 	
_validationMessages)) 
.))  
Add))  #
())# $
new))$ '
ValidationMessage))( 9
{)): ;
Message))< C
=))D E
msg))F I
,))I J
PropertyName))K W
=))X Y
propertyName))Z f
}))g h
)))h i
;))i j
IsValidationVisible** 
=**  !
true**" &
;**& '
}++ 	
public// 
virtual// 
void// 
Clear// !
(//! "
)//" #
{00 	
ValidationMessages11 
.11 
Clear11 $
(11$ %
)11% &
;11& '
IsValidationVisible22 
=22  !
false22" '
;22' (
}33 	
public77 
virtual77 
void77  
DisplayStatusMessage77 0
(770 1
string771 7
msg778 ;
=77< =
$str77> @
)77@ A
{88 	
MessageBroker99 
.99 
MessageBroker99 '
.99' (
Instance99( 0
.990 1
SendMessage991 <
(99< =!
MessageBrokerMessages99= R
.99R S 
DisplayStatusMessage99S g
,99g h
msg99i l
)99l m
;99m n
}:: 	
public>> 
void>> 
PublishException>> $
(>>$ %
	Exception>>% .
ex>>/ 1
)>>1 2
{?? 	
ExceptionManagerAA 
.AA 
InstanceAA %
.AA% &
PublishAA& -
(AA- .
exAA. 0
)AA0 1
;AA1 2
}BB 	
publicFF 
virtualFF 
voidFF 
CloseFF !
(FF! "
boolFF" &
wasCancelledFF' 3
=FF4 5
trueFF6 :
)FF: ;
{GG 	
MessageBrokerHH 
.HH 
MessageBrokerHH '
.HH' (
InstanceHH( 0
.HH0 1
SendMessageHH1 <
(HH< =!
MessageBrokerMessagesHH= R
.HHR S
CloseUserControlHHS c
,HHc d
wasCancelledHHe q
)HHq r
;HHr s
}II 	
publicMM 
virtualMM 
voidMM 
DisposeMM #
(MM# $
)MM$ %
{NN 	
}OO 	
}QQ 
}RR 