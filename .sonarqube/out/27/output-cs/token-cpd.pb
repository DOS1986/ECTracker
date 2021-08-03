‰
FC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker\App.xaml.cs
	namespace 	
	ECTracker
 
. 
Desktop 
. 
UI 
{ 
public 

partial 
class 
App 
: 
Application *
{		 
} 
} Î
JC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker\AssemblyInfo.cs
[ 
assembly 	
:	 

	ThemeInfo 
( &
ResourceDictionaryLocation 
. 
None #
,# $&
ResourceDictionaryLocation 
. 
SourceAssembly -
)

 
]

 ≈
JC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker\Bootstrapper.cs
	namespace		 	
	ECTracker		
 
.		 
Desktop		 
.		 
UI		 
{

 
public 

class 
Bootstrapper 
: 
BootstrapperBase  0
{ 
private 
readonly 
SimpleContainer (

_container) 3
=4 5
new6 9
SimpleContainer: I
(I J
)J K
;K L
public 
Bootstrapper 
( 
) 
{ 	

Initialize 
( 
) 
; 
} 	
	protected 
override 
void 
	Configure  )
() *
)* +
{ 	

_container 
. 
Instance 
(  

_container  *
)* +
;+ ,

_container 
. 
	Singleton 
< 
IWindowManager )
,) *
WindowManager+ 8
>8 9
(9 :
): ;
. 
	Singleton 
< 
IEventAggregator +
,+ ,
EventAggregator- <
>< =
(= >
)> ?
. 
	Singleton 
< 
DbRepository '
>' (
(( )
)) *
;* +
GetType 
( 
) 
. 
Assembly 
. 
GetTypes '
(' (
)( )
. 
Where 
( 
type 
=> 
type #
.# $
IsClass$ +
)+ ,
. 
Where 
( 
type 
=> 
type #
.# $
Name$ (
.( )
EndsWith) 1
(1 2
$str2 =
)= >
)> ?
.   
ToList   
(   
)   
.!! 
ForEach!! 
(!! 
viewModelType!! &
=>!!' )

_container!!* 4
.!!4 5
RegisterPerRequest!!5 G
(!!G H
viewModelType"" !
,""! "
viewModelType""# 0
.""0 1
ToString""1 9
(""9 :
)"": ;
,""; <
viewModelType""= J
)""J K
)""K L
;""L M
}## 	
	protected%% 
override%% 
void%% 
	OnStartup%%  )
(%%) *
object%%* 0
sender%%1 7
,%%7 8
StartupEventArgs%%9 I
e%%J K
)%%K L
{&& 	
DisplayRootViewFor'' 
<'' 
ShellViewModel'' -
>''- .
(''. /
)''/ 0
;''0 1
}(( 	
	protected** 
override** 
object** !
GetInstance**" -
(**- .
Type**. 2
service**3 :
,**: ;
string**< B
key**C F
)**F G
{++ 	
return,, 

_container,, 
.,, 
GetInstance,, )
(,,) *
service,,* 1
,,,1 2
key,,3 6
),,6 7
;,,7 8
}-- 	
	protected// 
override// 
IEnumerable// &
<//& '
object//' -
>//- .
GetAllInstances/// >
(//> ?
Type//? C
service//D K
)//K L
{00 	
return11 

_container11 
.11 
GetAllInstances11 -
(11- .
service11. 5
)115 6
;116 7
}22 	
	protected44 
override44 
void44 
BuildUp44  '
(44' (
object44( .
instance44/ 7
)447 8
{55 	

_container66 
.66 
BuildUp66 
(66 
instance66 '
)66' (
;66( )
}77 	
}88 
}99 µ
`C:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker\ViewModels\AnimatedSplashViewModel.cs
	namespace 	
	ECTracker
 
. 
Desktop 
. 
UI 
. 

ViewModels )
{ 
public 

class #
AnimatedSplashViewModel (
:) *
Screen+ 1
{ 
private		 
readonly		 
IEventAggregator		 )
_events		* 1
;		1 2
private 
string 
_splashMessage %
;% &
public 
string 
SplashMessage #
{ 	
get 
=> 
_splashMessage !
;! "
set 
{ 
_splashMessage 
=  
value! &
;& '"
NotifyOfPropertyChange &
(& '
(' (
)( )
=>* ,
SplashMessage- :
): ;
;; <
} 
} 	
public #
AnimatedSplashViewModel &
(& '
IEventAggregator' 7
events8 >
)> ?
{ 	
_events 
= 
events 
; 
SplashMessage 
= 
$str )
;) *
var 
worker 
= 
new 
BackgroundWorker -
(- .
). /
;/ 0
worker 
. 
DoWork 
+= 
Worker_DoWork *
;* +
worker 
. 
RunWorkerCompleted %
+=& (%
Worker_RunWorkerCompleted) B
;B C
worker   
.   
RunWorkerAsync   !
(  ! "
)  " #
;  # $
}## 	
private%% 
void%% %
Worker_RunWorkerCompleted%% .
(%%. /
object%%/ 5
sender%%6 <
,%%< ='
RunWorkerCompletedEventArgs%%> Y
e%%Z [
)%%[ \
{&& 	
}(( 	
private** 
static** 
void** 
Worker_DoWork** )
(**) *
object*** 0
sender**1 7
,**7 8
DoWorkEventArgs**9 H
e**I J
)**J K
{++ 	
Thread,, 
.,, 
Sleep,, 
(,, 
$num,, 
),, 
;,,  
}-- 	
}.. 
}// ò2
WC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker\ViewModels\ShellViewModel.cs
	namespace 	
	ECTracker
 
. 
Desktop 
. 
UI 
. 

ViewModels )
{ 
public 

class 
ShellViewModel 
:  !
ViewModelBase" /
{ 
private		 
string		 
_loginMenuHeader		 '
=		( )
$str		* 1
;		1 2
private

 
string

 
_statusMessage

 %
;

% &
private 
bool !
_isInfoMessageVisible *
=+ ,
true- 1
;1 2
private 
string 
_infoMessageTitle (
=) *
string+ 1
.1 2
Empty2 7
;7 8
private 
string 
_infoMessage #
=$ %
string& ,
., -
Empty- 2
;2 3
private 
const 
int 
Seconds !
=" #
$num$ (
;( )
private 
Timer 
_infoMessageTimer '
=( )
null* .
;. /
private 
int 
_infoMessageTimeout '
=( )
$num* .
;. /
public 
string 
LoginMenuHeader %
{ 	
get 
=> 
_loginMenuHeader #
;# $
set 
{ 
_loginMenuHeader  
=! "
value# (
;( ) 
RaisePropertyChanged $
($ %
$str% 6
)6 7
;7 8
} 
} 	
public 
int 
InfoMessageTimeout %
{ 	
get   
=>   
_infoMessageTimeout   &
;  & '
set!! 
{"" 
_infoMessageTimeout## #
=##$ %
value##& +
;##+ , 
RaisePropertyChanged$$ $
($$$ %
$str$$% 9
)$$9 :
;$$: ;
}%% 
}&& 	
public(( 
virtual(( 
void(( "
CreateInfoMessageTimer(( 2
(((2 3
)((3 4
{)) 	
if** 
(** 
_infoMessageTimer** !
==**" $
null**% )
)**) *
{++ 
_infoMessageTimer-- !
=--" #
new--$ '
Timer--( -
(--- .
_infoMessageTimeout--. A
)--A B
;--B C
_infoMessageTimer00 !
.00! "
Elapsed00" )
+=00* , 
MessageTimer_Elapsed00- A
;00A B
}11 
_infoMessageTimer33 
.33 
	AutoReset33 '
=33( )
false33* /
;33/ 0
_infoMessageTimer44 
.44 
Enabled44 %
=44& '
true44( ,
;44, - 
IsInfoMessageVisible55  
=55! "
true55# '
;55' (
}66 	
private88 
void88  
MessageTimer_Elapsed88 )
(88) *
object88* 0
sender881 7
,887 8
ElapsedEventArgs889 I
e88J K
)88K L
{99 	 
IsInfoMessageVisible::  
=::! "
false::# (
;::( )
};; 	
public== 
string== 
StatusMessage== #
{>> 	
get?? 
=>?? 
_statusMessage?? !
;??! "
set@@ 
{AA 
_statusMessageBB 
=BB  
valueBB! &
;BB& ' 
RaisePropertyChangedCC $
(CC$ %
$strCC% 4
)CC4 5
;CC5 6
}DD 
}EE 	
publicGG 
boolGG  
IsInfoMessageVisibleGG (
{HH 	
getII 
=>II !
_isInfoMessageVisibleII (
;II( )
setKK 
{LL !
_isInfoMessageVisibleMM %
=MM& '
valueMM( -
;MM- . 
RaisePropertyChangedNN $
(NN$ %
$strNN% ;
)NN; <
;NN< =
}OO 
}PP 	
publicRR 
stringRR 
InfoMessageRR !
{SS 	
getTT 
=>TT 
_infoMessageTT 
;TT  
setUU 
{VV 
_infoMessageWW 
=WW 
valueWW $
;WW$ % 
RaisePropertyChangedXX $
(XX$ %
$strXX% 2
)XX2 3
;XX3 4
}YY 
}ZZ 	
public\\ 
string\\ 
InfoMessageTitle\\ &
{]] 	
get^^ 
=>^^ 
_infoMessageTitle^^ $
;^^$ %
set__ 
{`` 
_infoMessageTitleaa !
=aa" #
valueaa$ )
;aa) * 
RaisePropertyChangedbb $
(bb$ %
$strbb% 7
)bb7 8
;bb8 9
}cc 
}dd 	
publichh 
voidhh 
LoadStateCodeshh "
(hh" #
)hh# $
{ii 	
Systemkk 
.kk 
	Threadingkk 
.kk 
Threadkk #
.kk# $
Sleepkk$ )
(kk) *
Secondskk* 1
)kk1 2
;kk2 3
}ll 	
publicnn 
voidnn 
LoadCountryCodesnn $
(nn$ %
)nn% &
{oo 	
Systemqq 
.qq 
	Threadingqq 
.qq 
Threadqq #
.qq# $
Sleepqq$ )
(qq) *
Secondsqq* 1
)qq1 2
;qq2 3
}rr 	
publictt 
voidtt 
LoadEmployeeTypestt %
(tt% &
)tt& '
{uu 	
Systemww 
.ww 
	Threadingww 
.ww 
Threadww #
.ww# $
Sleepww$ )
(ww) *
Secondsww* 1
)ww1 2
;ww2 3
}xx 	
publiczz 
voidzz 
ClearInfoMessageszz %
(zz% &
)zz& '
{{{ 	
InfoMessage|| 
=|| 
string||  
.||  !
Empty||! &
;||& '
InfoMessageTitle}} 
=}} 
string}} %
.}}% &
Empty}}& +
;}}+ , 
IsInfoMessageVisible~~  
=~~! "
false~~# (
;~~( )
} 	
}
ÅÅ 
}ÇÇ √	
bC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker\ViewModels\SplashMessageChangedEvent.cs
	namespace 	
	ECTracker
 
. 
Desktop 
. 
UI 
. 

ViewModels )
{ 
public 

class %
SplashMessageChangedEvent *
{ 
public 
string 
Content 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
CloseDialog 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
false0 5
;5 6
public %
SplashMessageChangedEvent (
(( )
string) /
content0 7
)7 8
{		 	
Content

 
=

 
content

 
;

 
} 	
public %
SplashMessageChangedEvent (
(( )
bool) -
closeDialog. 9
)9 :
{ 	
CloseDialog 
= 
closeDialog %
;% &
} 	
} 
} „
[C:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker\Views\AnimatedSplashView.xaml.cs
	namespace 	
	ECTracker
 
. 
Desktop 
. 
UI 
. 
Views $
{ 
public 

partial 
class 
AnimatedSplashView +
:, -
Window. 4
{ 
public 
AnimatedSplashView !
(! "
)" #
{ 	
InitializeComponent 
(  
)  !
;! "
} 	
} 
} ˝b
RC:\code\c-sharp\src\github.com\DOS1986\ECTracker\ECTracker\Views\ShellView.xaml.cs
	namespace 	
	ECTracker
 
. 
Desktop 
. 
UI 
. 
Views $
{ 
public 

partial 
class 
	ShellView "
:# $
Window% +
{ 
private 
readonly 
ShellViewModel '

_viewModel( 2
=3 4
null5 9
;9 :
private 
readonly 
string 
_originalMessage  0
;0 1
public 
	ShellView 
( 
) 
{ 	
InitializeComponent 
(  
)  !
;! "
Title 
= 
$" 
$str  
{  !
GetVersionNumber! 1
(1 2
)2 3
}3 4
"4 5
;5 6

_viewModel 
= 
( 
ShellViewModel (
)( )
this 
. 
	Resources 
[ 
$str *
]* +
;+ ,
_originalMessage 
= 

_viewModel )
.) *
StatusMessage* 7
;7 8
MessageBroker"" 
."" 
Instance"" "
.""" #
MessageReceived""# 2
+=""3 5$
Instance_MessageReceived""6 N
;""N O
}## 	
public%% 
string%% 
GetVersionNumber%% &
(%%& '
)%%' (
{&& 	
var'' 
assembly'' 
='' 
Assembly'' #
.''# $ 
GetExecutingAssembly''$ 8
(''8 9
)''9 :
;'': ;
var(( 
fileVersionInfo(( 
=((  !
FileVersionInfo((" 1
.((1 2
GetVersionInfo((2 @
(((@ A
assembly((A I
.((I J
Location((J R
)((R S
;((S T
var)) 
version)) 
=)) 
fileVersionInfo)) )
.))) *
ProductVersion))* 8
;))8 9
return** 
version** 
;** 
}++ 	
public-- 
async-- 
Task-- 
LoadApplication-- )
(--) *
)--* +
{.. 	

_viewModel// 
.// 
InfoMessage// "
=//# $
$str//% =
;//= >
await00 

Dispatcher00 
.00 
BeginInvoke00 (
(00( )
new00) ,
Action00- 3
(003 4
(004 5
)005 6
=>007 9
{11 

_viewModel22 
.22 
LoadStateCodes22 )
(22) *
)22* +
;22+ ,
}33 
)33 
,33 
DispatcherPriority33 "
.33" #

Background33# -
)33- .
;33. /

_viewModel55 
.55 
InfoMessage55 "
=55# $
$str55% ?
;55? @
await66 

Dispatcher66 
.66 
BeginInvoke66 (
(66( )
new66) ,
Action66- 3
(663 4
(664 5
)665 6
=>667 9
{77 

_viewModel88 
.88 
LoadCountryCodes88 +
(88+ ,
)88, -
;88- .
}99 
)99 
,99 
DispatcherPriority99 "
.99" #

Background99# -
)99- .
;99. /

_viewModel;; 
.;; 
InfoMessage;; "
=;;# $
$str;;% @
;;;@ A
await<< 

Dispatcher<< 
.<< 
BeginInvoke<< (
(<<( )
new<<) ,
Action<<- 3
(<<3 4
(<<4 5
)<<5 6
=><<7 9
{== 

_viewModel>> 
.>> 
LoadEmployeeTypes>> ,
(>>, -
)>>- .
;>>. /
}?? 
)?? 
,?? 
DispatcherPriority?? "
.??" #

Background??# -
)??- .
;??. /
}@@ 	
publicBB 
voidBB 
DisplayUserControlBB &
(BB& '
UserControlBB' 2
ucBB3 5
)BB5 6
{CC 	
ContentAreaEE 
.EE 
ChildrenEE  
.EE  !
AddEE! $
(EE$ %
ucEE% '
)EE' (
;EE( )
}FF 	
privateHH 
voidHH 
MenuItem_ClickHH #
(HH# $
objectHH$ *
senderHH+ 1
,HH1 2
RoutedEventArgsHH3 B
eHHC D
)HHD E
{II 	
varJJ 
mnuJJ 
=JJ 
(JJ 
MenuItemJJ 
)JJ  
senderJJ  &
;JJ& '
ifMM 
(MM 
mnuMM 
.MM 
TagMM 
==MM 
nullMM 
)MM  
{NN 
returnOO 
;OO 
}PP 
varRR 
cmdRR 
=RR 
mnuRR 
.RR 
TagRR 
.RR 
ToStringRR &
(RR& '
)RR' (
;RR( )
ifSS 
(SS 
cmdSS 
!=SS 
nullSS 
&&SS 
cmdSS "
.SS" #
ContainsSS# +
(SS+ ,
$strSS, /
)SS/ 0
)SS0 1
{TT 
LoadUserControlVV 
(VV  
cmdVV  #
)VV# $
;VV$ %
}WW 
elseXX 
{YY 
ProcessMenuCommands[[ #
([[# $
cmd[[$ '
)[[' (
;[[( )
}\\ 
}]] 	
private__ 
async__ 
void__ 
Window_Loaded__ (
(__( )
object__) /
sender__0 6
,__6 7
RoutedEventArgs__8 G
e__H I
)__I J
{`` 	
awaitbb 
LoadApplicationbb !
(bb! "
)bb" #
;bb# $

_viewModelee 
.ee 
ClearInfoMessagesee (
(ee( )
)ee) *
;ee* +
}ff 	
privatehh 
voidhh 
CloseUserControlhh %
(hh% &
)hh& '
{ii 	
ContentAreakk 
.kk 
Childrenkk  
.kk  !
Clearkk! &
(kk& '
)kk' (
;kk( )

_viewModelnn 
.nn 
StatusMessagenn $
=nn% &
_originalMessagenn' 7
;nn7 8
}oo 	
privateqq 
voidqq 
LoadUserControlqq $
(qq$ %
stringqq% +
controlNameqq, 7
)qq7 8
{rr 	
varuu 
ucTypeuu 
=uu 
Typeuu 
.uu 
GetTypeuu %
(uu% &
controlNameuu& 1
)uu1 2
;uu2 3
ifvv 
(vv 
!vv !
ShouldLoadUserControlvv &
(vv& '
controlNamevv' 2
)vv2 3
)vv3 4
returnvv5 ;
;vv; <
ifww 
(ww 
ucTypeww 
==ww 
nullww 
)ww 
{xx 

MessageBoxyy 
.yy 
Showyy 
(yy  
$stryy  /
+yy0 1
controlNameyy2 =
+yy> ?
$stryy@ R
)yyR S
;yyS T
}zz 
else{{ 
{|| 
CloseUserControl~~  
(~~  !
)~~! "
;~~" #
var
ÅÅ 
uc
ÅÅ 
=
ÅÅ 
(
ÅÅ 
UserControl
ÅÅ %
)
ÅÅ% &
	Activator
ÅÅ& /
.
ÅÅ/ 0
CreateInstance
ÅÅ0 >
(
ÅÅ> ?
ucType
ÅÅ? E
)
ÅÅE F
;
ÅÅF G
if
ÇÇ 
(
ÇÇ 
uc
ÇÇ 
!=
ÇÇ 
null
ÇÇ 
)
ÇÇ 
{
ÉÉ  
DisplayUserControl
ÖÖ &
(
ÖÖ& '
uc
ÖÖ' )
)
ÖÖ) *
;
ÖÖ* +
}
ÜÜ 
}
áá 
}
àà 	
private
ää 
bool
ää #
ShouldLoadUserControl
ää *
(
ää* +
string
ää+ 1
controlName
ää2 =
)
ää= >
{
ãã 	
var
åå 
ret
åå 
=
åå 
true
åå 
;
åå 
if
èè 
(
èè 
ContentArea
èè 
.
èè 
Children
èè $
.
èè$ %
Count
èè% *
<=
èè+ -
$num
èè. /
)
èè/ 0
return
èè1 7
true
èè8 <
;
èè< =
if
êê 
(
êê 
(
êê 
(
êê 
UserControl
êê 
)
êê 
ContentArea
êê )
.
êê) *
Children
êê* 2
[
êê2 3
$num
êê3 4
]
êê4 5
)
êê5 6
.
êê6 7
GetType
êê7 >
(
êê> ?
)
êê? @
.
êê@ A
FullName
êêA I
==
êêJ L
controlName
êêM X
)
êêX Y
{
ëë 
ret
íí 
=
íí 
false
íí 
;
íí 
}
ìì 
return
ïï 
ret
ïï 
;
ïï 
}
ññ 	
private
òò 
void
òò !
ProcessMenuCommands
òò (
(
òò( )
string
òò) /
command
òò0 7
)
òò7 8
{
ôô 	
switch
öö 
(
öö 
command
öö 
.
öö 
ToLower
öö #
(
öö# $
)
öö$ %
)
öö% &
{
õõ 
case
úú 
$str
úú 
:
úú 
Close
ùù 
(
ùù 
)
ùù 
;
ùù 
break
ûû 
;
ûû 
case
üü 
$str
üü 
:
üü 
LoadUserControl
ÆÆ #
(
ÆÆ# $
$str
ÆÆ$ J
)
ÆÆJ K
;
ÆÆK L
break
∞∞ 
;
∞∞ 
}
±± 
}
≤≤ 	
private
¥¥ 
void
¥¥ &
Instance_MessageReceived
¥¥ -
(
¥¥- .
object
¥¥. 4
sender
¥¥5 ;
,
¥¥; <$
MessageBrokerEventArgs
¥¥= S
e
¥¥T U
)
¥¥U V
{
µµ 	
switch
∂∂ 
(
∂∂ 
e
∂∂ 
.
∂∂ 
MessageName
∂∂ !
)
∂∂! "
{
∑∑ 
case
∏∏ #
MessageBrokerMessages
∏∏ *
.
∏∏* +
LoginSuccess
∏∏+ 7
:
∏∏7 8

_viewModel
∫∫ 
.
∫∫ 
LoginMenuHeader
∫∫ .
=
∫∫/ 0
$str
∫∫1 :
;
∫∫: ;
break
ªª 
;
ªª 
case
ºº #
MessageBrokerMessages
ºº *
.
ºº* +
Logout
ºº+ 1
:
ºº1 2

_viewModel
ææ 
.
ææ 
LoginMenuHeader
ææ .
=
ææ/ 0
$str
ææ1 8
;
ææ8 9
break
øø 
;
øø 
case
¿¿ #
MessageBrokerMessages
¿¿ *
.
¿¿* +"
DisplayStatusMessage
¿¿+ ?
:
¿¿? @

_viewModel
¬¬ 
.
¬¬ 
StatusMessage
¬¬ ,
=
¬¬- .
e
¬¬/ 0
.
¬¬0 1
MessagePayload
¬¬1 ?
.
¬¬? @
ToString
¬¬@ H
(
¬¬H I
)
¬¬I J
;
¬¬J K
break
√√ 
;
√√ 
case
ƒƒ #
MessageBrokerMessages
ƒƒ *
.
ƒƒ* +
CloseUserControl
ƒƒ+ ;
:
ƒƒ; <
CloseUserControl
≈≈ $
(
≈≈$ %
)
≈≈% &
;
≈≈& '
break
∆∆ 
;
∆∆ 
case
«« #
MessageBrokerMessages
«« *
.
««* +,
DisplayTimeoutInfoMessageTitle
««+ I
:
««I J

_viewModel
»» 
.
»» 
InfoMessageTitle
»» /
=
»»0 1
e
»»2 3
.
»»3 4
MessagePayload
»»4 B
.
»»B C
ToString
»»C K
(
»»K L
)
»»L M
;
»»M N

_viewModel
…… 
.
…… $
CreateInfoMessageTimer
…… 5
(
……5 6
)
……6 7
;
……7 8
break
   
;
   
case
ÀÀ #
MessageBrokerMessages
ÀÀ *
.
ÀÀ* +'
DisplayTimeoutInfoMessage
ÀÀ+ D
:
ÀÀD E

_viewModel
ÃÃ 
.
ÃÃ 
InfoMessage
ÃÃ *
=
ÃÃ+ ,
e
ÃÃ- .
.
ÃÃ. /
MessagePayload
ÃÃ/ =
.
ÃÃ= >
ToString
ÃÃ> F
(
ÃÃF G
)
ÃÃG H
;
ÃÃH I

_viewModel
ÕÕ 
.
ÕÕ $
CreateInfoMessageTimer
ÕÕ 5
(
ÕÕ5 6
)
ÕÕ6 7
;
ÕÕ7 8
break
ŒŒ 
;
ŒŒ 
}
œœ 
}
–– 	
}
—— 
}““ 