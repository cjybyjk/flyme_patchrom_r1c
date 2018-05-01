.class public final Lcom/qti/dpm/DpmService;
.super Ljava/lang/Object;
.source "DpmService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/qti/dpm/DpmService$3;,
        Lcom/qti/dpm/DpmService$DpmReceiver;,
        Lcom/qti/dpm/DpmService$DpmSender;,
        Lcom/qti/dpm/DpmService$ApnTypeToInt;,
        Lcom/qti/dpm/DpmService$DpmWwanInfo;,
        Lcom/qti/dpm/DpmService$DpmWifiInfo;,
        Lcom/qti/dpm/DpmService$DpmRatInfo;,
        Lcom/qti/dpm/DpmService$FeatureType;
    }
.end annotation


# static fields
.field private static final DBG:Z = false

.field static final DPM_DEBUG_LOGLEVEL:I = 0xf86

.field static final DPM_MAX_COMMAND_BYTES:I = 0x2000

.field static final DPM_NET_SUBTYPE_WLAN_B:I = 0x14

.field static final DPM_NET_SUBTYPE_WLAN_G:I = 0x15

.field public static final DPM_RET_BUSY:I = -0x2

.field public static final DPM_RET_ERROR:I = -0x1

.field public static final DPM_RET_FEATURE_UNSUPPORTED:I = -0x4

.field public static final DPM_RET_FILE_SIZE_TOO_LARGE:I = -0x5

.field public static final DPM_RET_INVALID_ARGS:I = -0x3

.field public static final DPM_RET_INVALID_VERSION:I = -0x8

.field public static final DPM_RET_PATH_ACCESS_DENIED:I = -0x6

.field public static final DPM_RET_PATH_NAME_TOO_LONG:I = -0x7

.field public static final DPM_RET_SUCCESS:I = 0x3e8

.field static final DPM_S_NOTIFY_APP_INFO_LIST_CHG:I = 0xc

.field static final DPM_S_NOTIFY_INIT_DONE:I = 0x8

.field static final DPM_S_NOTIFY_NSRM_BKG_EVT_STATE_CHG:I = 0xb

.field static final DPM_S_NOTIFY_SCREEN_STATE_CHG:I = 0xd

.field static final DPM_S_NOTIFY_TETHERING_STATE_CHG:I = 0xe

.field static final DPM_S_NOTIFY_WLAN_STATE_CHG:I = 0x9

.field static final DPM_S_NOTIFY_WWAN_STATE_CHG:I = 0xa

.field static final DPM_S_REQ_GET_FEATURE_STATUS:I = 0x1

.field static final DPM_S_REQ_REFRESH_NSRM_CONFIG:I = 0x5

.field static final DPM_S_REQ_SET_FEATURE_PREF:I = 0x3

.field static final DPM_S_RESP_SET_FEATURE_PREF:I = 0x4

.field static final DPM_S_RSP_GET_FEATURE_STATUS:I = 0x2

.field static final DPM_S_RSP_REFRESH_NSRM_CONFIG:I = 0x6

.field static final DPM_VERBOSE_LOGLEVEL:I = 0x1e91

.field public static final EVENT_POSTDPMDINIT:I = 0x3

.field public static final EVENT_SEND:I = 0x1

.field public static final EVENT_TOGGLE_WIFI:I = 0x2

.field private static final MAX_DNS_ADDRS:I = 0x2

.field private static final MAX_FILE_PATH_LENGTH:I = 0x400

.field private static final MAX_NSRM_FILE_SIZE:J = 0xc800L

.field private static final POLICY_TYPE_NSRM:I = 0x1

.field static final RESPONSE_SOLICITED:I = 0x0

.field static final RESPONSE_UNSOLICITED:I = 0x1

.field static final SOCKET_NAME_DPM:Ljava/lang/String; = "dpmd"

.field static final SOCKET_OPEN_RETRY_MILLIS:I = 0xfa0

.field private static final SUB_TYPE:Ljava/lang/String; = "SERVICE"

.field public static final dataPath:Ljava/lang/String; = "/data/dpm/"

.field static isDispatched:Z = false

.field static isDpmdDisconnected:Z = false

.field static isDpmdUp:Z = false

.field private static isNsrmConfigUpdateBusy:Z = false

.field public static final systemPath:Ljava/lang/String; = "/system/etc/dpm/"


# instance fields
.field DPM_EVENT_STATE_OFF:Z

.field DPM_EVENT_STATE_ON:Z

.field apnToInt:Lcom/qti/dpm/DpmService$ApnTypeToInt;

.field private apnTypeValue:I

.field private bluetoothTethered:Z

.field private mContext:Landroid/content/Context;

.field private mDefaultNetwork:I

.field mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mNetworkType:I

.field private mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field mReceiver:Lcom/qti/dpm/DpmService$DpmReceiver;

.field mReceiverThread:Ljava/lang/Thread;

.field mRequestMessagesPending:I

.field mRequestsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/qti/dpm/DpmRequest;",
            ">;"
        }
    .end annotation
.end field

.field private mScreenOn:Z

.field mSender:Lcom/qti/dpm/DpmService$DpmSender;

.field mSenderThread:Landroid/os/HandlerThread;

.field mSocket:Landroid/net/LocalSocket;

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;

.field private mWifiManager:Landroid/net/wifi/WifiManager;

.field private nsrmConfigHasBeenInit:Z

.field private usbTethered:Z

.field private wifiTethered:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 70
    sput-boolean v0, Lcom/qti/dpm/DpmService;->isNsrmConfigUpdateBusy:Z

    .line 100
    sput-boolean v0, Lcom/qti/dpm/DpmService;->isDpmdUp:Z

    .line 103
    sput-boolean v0, Lcom/qti/dpm/DpmService;->isDpmdDisconnected:Z

    .line 106
    sput-boolean v0, Lcom/qti/dpm/DpmService;->isDispatched:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/server/ConnectivityService;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mService"    # Lcom/android/server/ConnectivityService;

    .prologue
    const/4 v6, 0x1

    const/4 v4, -0x1

    const/4 v5, 0x0

    .line 792
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput v4, p0, Lcom/qti/dpm/DpmService;->apnTypeValue:I

    .line 83
    iput-boolean v5, p0, Lcom/qti/dpm/DpmService;->wifiTethered:Z

    .line 84
    iput-boolean v5, p0, Lcom/qti/dpm/DpmService;->usbTethered:Z

    .line 85
    iput-boolean v5, p0, Lcom/qti/dpm/DpmService;->bluetoothTethered:Z

    .line 87
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/qti/dpm/DpmService;->mRequestsList:Ljava/util/ArrayList;

    .line 148
    iput-boolean v6, p0, Lcom/qti/dpm/DpmService;->DPM_EVENT_STATE_ON:Z

    .line 149
    iput-boolean v5, p0, Lcom/qti/dpm/DpmService;->DPM_EVENT_STATE_OFF:Z

    .line 156
    const/16 v3, 0xe

    iput v3, p0, Lcom/qti/dpm/DpmService;->mDefaultNetwork:I

    .line 157
    iput v4, p0, Lcom/qti/dpm/DpmService;->mNetworkType:I

    .line 160
    iput-boolean v5, p0, Lcom/qti/dpm/DpmService;->nsrmConfigHasBeenInit:Z

    .line 362
    new-instance v3, Lcom/qti/dpm/DpmService$ApnTypeToInt;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/qti/dpm/DpmService$ApnTypeToInt;-><init>(Lcom/qti/dpm/DpmService;Lcom/qti/dpm/DpmService$1;)V

    iput-object v3, p0, Lcom/qti/dpm/DpmService;->apnToInt:Lcom/qti/dpm/DpmService$ApnTypeToInt;

    .line 364
    new-instance v3, Lcom/qti/dpm/DpmService$1;

    invoke-direct {v3, p0}, Lcom/qti/dpm/DpmService$1;-><init>(Lcom/qti/dpm/DpmService;)V

    iput-object v3, p0, Lcom/qti/dpm/DpmService;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 899
    new-instance v3, Lcom/qti/dpm/DpmService$2;

    invoke-direct {v3, p0}, Lcom/qti/dpm/DpmService$2;-><init>(Lcom/qti/dpm/DpmService;)V

    iput-object v3, p0, Lcom/qti/dpm/DpmService;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 795
    iput v5, p0, Lcom/qti/dpm/DpmService;->mRequestMessagesPending:I

    .line 796
    iput-object p1, p0, Lcom/qti/dpm/DpmService;->mContext:Landroid/content/Context;

    .line 797
    new-instance v3, Landroid/os/HandlerThread;

    const-string v4, "DPMSender"

    invoke-direct {v3, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/qti/dpm/DpmService;->mSenderThread:Landroid/os/HandlerThread;

    .line 798
    iget-object v3, p0, Lcom/qti/dpm/DpmService;->mSenderThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->start()V

    .line 800
    const-string v3, "persist.dpm.loglevel"

    invoke-static {v3, v5}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 801
    .local v2, "val":I
    const/16 v3, 0xf86

    if-eq v2, v3, :cond_0

    const/16 v3, 0x1e91

    if-ne v2, v3, :cond_1

    .line 802
    :cond_0
    sput-boolean v6, Lcom/qti/dpm/DpmMsg;->ADDTL_MSG:Z

    .line 805
    :cond_1
    iget-object v3, p0, Lcom/qti/dpm/DpmService;->mSenderThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    .line 806
    .local v1, "looper":Landroid/os/Looper;
    if-nez v1, :cond_2

    .line 807
    const-string v3, "SERVICE"

    const-string v4, "Looper obj is NULL."

    invoke-static {v3, v4}, Lcom/qti/dpm/DpmService;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 831
    :goto_0
    return-void

    .line 810
    :cond_2
    new-instance v3, Lcom/qti/dpm/DpmService$DpmSender;

    invoke-direct {v3, p0, v1}, Lcom/qti/dpm/DpmService$DpmSender;-><init>(Lcom/qti/dpm/DpmService;Landroid/os/Looper;)V

    iput-object v3, p0, Lcom/qti/dpm/DpmService;->mSender:Lcom/qti/dpm/DpmService$DpmSender;

    .line 812
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 813
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 814
    const-string v3, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 817
    const-string v3, "android.intent.action.ANY_DATA_STATE"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 818
    const-string v3, "android.net.conn.TETHER_STATE_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 820
    iget-object v3, p0, Lcom/qti/dpm/DpmService;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 822
    iget-object v3, p0, Lcom/qti/dpm/DpmService;->mContext:Landroid/content/Context;

    const-string v4, "wifi"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/WifiManager;

    iput-object v3, p0, Lcom/qti/dpm/DpmService;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 823
    iget-object v3, p0, Lcom/qti/dpm/DpmService;->mContext:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    iput-object v3, p0, Lcom/qti/dpm/DpmService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 826
    iget-object v3, p0, Lcom/qti/dpm/DpmService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v4, p0, Lcom/qti/dpm/DpmService;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v5, 0x40

    invoke-virtual {v3, v4, v5}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 828
    new-instance v3, Lcom/qti/dpm/DpmService$DpmReceiver;

    invoke-direct {v3, p0}, Lcom/qti/dpm/DpmService$DpmReceiver;-><init>(Lcom/qti/dpm/DpmService;)V

    iput-object v3, p0, Lcom/qti/dpm/DpmService;->mReceiver:Lcom/qti/dpm/DpmService$DpmReceiver;

    .line 829
    new-instance v3, Ljava/lang/Thread;

    iget-object v4, p0, Lcom/qti/dpm/DpmService;->mReceiver:Lcom/qti/dpm/DpmService$DpmReceiver;

    const-string v5, "DPMReceiver"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/qti/dpm/DpmService;->mReceiverThread:Ljava/lang/Thread;

    .line 830
    iget-object v3, p0, Lcom/qti/dpm/DpmService;->mReceiverThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method private NetworkStateToInt(Landroid/net/NetworkInfo$State;)I
    .locals 2
    .param p1, "state"    # Landroid/net/NetworkInfo$State;

    .prologue
    .line 908
    sget-object v0, Lcom/qti/dpm/DpmService$3;->$SwitchMap$android$net$NetworkInfo$State:[I

    invoke-virtual {p1}, Landroid/net/NetworkInfo$State;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 922
    const/4 v0, -0x1

    :goto_0
    return v0

    .line 910
    :pswitch_0
    const/4 v0, 0x0

    goto :goto_0

    .line 912
    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    .line 914
    :pswitch_2
    const/4 v0, 0x2

    goto :goto_0

    .line 916
    :pswitch_3
    const/4 v0, 0x3

    goto :goto_0

    .line 918
    :pswitch_4
    const/4 v0, 0x4

    goto :goto_0

    .line 920
    :pswitch_5
    const/4 v0, 0x5

    goto :goto_0

    .line 908
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method static synthetic access$000(Lcom/qti/dpm/DpmService;Landroid/net/NetworkInfo$State;)I
    .locals 1
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # Landroid/net/NetworkInfo$State;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/qti/dpm/DpmService;->NetworkStateToInt(Landroid/net/NetworkInfo$State;)I

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/qti/dpm/DpmService;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/qti/dpm/DpmService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/qti/dpm/DpmService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;

    .prologue
    .line 63
    iget-boolean v0, p0, Lcom/qti/dpm/DpmService;->wifiTethered:Z

    return v0
.end method

.method static synthetic access$1102(Lcom/qti/dpm/DpmService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # Z

    .prologue
    .line 63
    iput-boolean p1, p0, Lcom/qti/dpm/DpmService;->wifiTethered:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/qti/dpm/DpmService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;

    .prologue
    .line 63
    iget-boolean v0, p0, Lcom/qti/dpm/DpmService;->usbTethered:Z

    return v0
.end method

.method static synthetic access$1202(Lcom/qti/dpm/DpmService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # Z

    .prologue
    .line 63
    iput-boolean p1, p0, Lcom/qti/dpm/DpmService;->usbTethered:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/qti/dpm/DpmService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;

    .prologue
    .line 63
    iget-boolean v0, p0, Lcom/qti/dpm/DpmService;->bluetoothTethered:Z

    return v0
.end method

.method static synthetic access$1302(Lcom/qti/dpm/DpmService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # Z

    .prologue
    .line 63
    iput-boolean p1, p0, Lcom/qti/dpm/DpmService;->bluetoothTethered:Z

    return p1
.end method

.method static synthetic access$1400(Lcom/qti/dpm/DpmService;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # Z

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/qti/dpm/DpmService;->sendTetheringState(Z)V

    return-void
.end method

.method static synthetic access$1500(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/qti/dpm/DpmService;I)Lcom/qti/dpm/DpmRequest;
    .locals 1
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # I

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/qti/dpm/DpmService;->findAndRemoveRequestFromList(I)Lcom/qti/dpm/DpmRequest;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1700(Lcom/qti/dpm/DpmService;)Landroid/net/wifi/WifiManager;
    .locals 1
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/qti/dpm/DpmService;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object v0
.end method

.method static synthetic access$1800(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmService;->rlog(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1900(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmService;->dlogi(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/qti/dpm/DpmService;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # Z

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/qti/dpm/DpmService;->sendScreenState(Z)V

    return-void
.end method

.method static synthetic access$2000(Lcom/qti/dpm/DpmService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/qti/dpm/DpmService;->sendInitReq()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2200(Ljava/io/InputStream;[B)I
    .locals 1
    .param p0, "x0"    # Ljava/io/InputStream;
    .param p1, "x1"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmService;->readDPMMessage(Ljava/io/InputStream;[B)I

    move-result v0

    return v0
.end method

.method static synthetic access$2300(Lcom/qti/dpm/DpmService;Landroid/os/Parcel;)V
    .locals 0
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # Landroid/os/Parcel;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/qti/dpm/DpmService;->processResponse(Landroid/os/Parcel;)V

    return-void
.end method

.method static synthetic access$2400(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmService;->logi(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2502(Lcom/qti/dpm/DpmService;I)I
    .locals 0
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # I

    .prologue
    .line 63
    iput p1, p0, Lcom/qti/dpm/DpmService;->mNetworkType:I

    return p1
.end method

.method static synthetic access$302(Lcom/qti/dpm/DpmService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # Z

    .prologue
    .line 63
    iput-boolean p1, p0, Lcom/qti/dpm/DpmService;->mScreenOn:Z

    return p1
.end method

.method static synthetic access$400(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmService;->loge(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$502(Lcom/qti/dpm/DpmService;I)I
    .locals 0
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # I

    .prologue
    .line 63
    iput p1, p0, Lcom/qti/dpm/DpmService;->apnTypeValue:I

    return p1
.end method

.method static synthetic access$700(Lcom/qti/dpm/DpmService;Lcom/qti/dpm/DpmService$DpmWwanInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/qti/dpm/DpmService;
    .param p1, "x1"    # Lcom/qti/dpm/DpmService$DpmWwanInfo;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/qti/dpm/DpmService;->sendWwanStatus(Lcom/qti/dpm/DpmService$DpmWwanInfo;)V

    return-void
.end method

.method static synthetic access$800(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmService;->dlogd(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmService;->logd(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private checkFeatureEnabled(Lcom/qti/dpm/DpmService$FeatureType;)Z
    .locals 6
    .param p1, "feature"    # Lcom/qti/dpm/DpmService$FeatureType;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 964
    const-string v4, "persist.dpm.feature"

    invoke-static {v4, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 965
    .local v1, "value":I
    const/4 v0, 0x0

    .line 966
    .local v0, "enabled":Z
    sget-object v4, Lcom/qti/dpm/DpmService$3;->$SwitchMap$com$qti$dpm$DpmService$FeatureType:[I

    invoke-virtual {p1}, Lcom/qti/dpm/DpmService$FeatureType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 968
    const/4 v0, 0x0

    .line 971
    :goto_0
    if-nez v0, :cond_2

    .line 972
    const-string v3, "SERVICE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Feature "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is not enabled"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/qti/dpm/DpmService;->dloge(Ljava/lang/String;Ljava/lang/String;)V

    .line 975
    :goto_1
    return v2

    .line 967
    :pswitch_0
    const/4 v4, 0x4

    if-eq v1, v4, :cond_0

    const/4 v4, 0x6

    if-ne v1, v4, :cond_1

    :cond_0
    move v0, v3

    :goto_2
    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_2

    :cond_2
    move v2, v3

    .line 975
    goto :goto_1

    .line 966
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private static dlogd(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1198
    return-void
.end method

.method private static dloge(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1210
    return-void
.end method

.method private static dlogi(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1204
    return-void
.end method

.method private static dlogv(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1201
    return-void
.end method

.method private static dlogw(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1207
    return-void
.end method

.method private findAndRemoveRequestFromList(I)Lcom/qti/dpm/DpmRequest;
    .locals 5
    .param p1, "serial"    # I

    .prologue
    .line 852
    iget-object v4, p0, Lcom/qti/dpm/DpmService;->mRequestsList:Ljava/util/ArrayList;

    monitor-enter v4

    .line 853
    const/4 v0, 0x0

    .local v0, "i":I
    :try_start_0
    iget-object v3, p0, Lcom/qti/dpm/DpmService;->mRequestsList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .local v2, "s":I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 854
    iget-object v3, p0, Lcom/qti/dpm/DpmService;->mRequestsList:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/qti/dpm/DpmRequest;

    .line 855
    .local v1, "rr":Lcom/qti/dpm/DpmRequest;
    iget v3, v1, Lcom/qti/dpm/DpmRequest;->mSerial:I

    if-ne v3, p1, :cond_0

    .line 856
    iget-object v3, p0, Lcom/qti/dpm/DpmService;->mRequestsList:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 857
    monitor-exit v4

    .line 861
    .end local v1    # "rr":Lcom/qti/dpm/DpmRequest;
    :goto_1
    return-object v1

    .line 853
    .restart local v1    # "rr":Lcom/qti/dpm/DpmRequest;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 860
    .end local v1    # "rr":Lcom/qti/dpm/DpmRequest;
    :cond_1
    monitor-exit v4

    .line 861
    const/4 v1, 0x0

    goto :goto_1

    .line 860
    .end local v2    # "s":I
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method private getPhone()Lcom/android/internal/telephony/ITelephony;
    .locals 1

    .prologue
    .line 756
    const-string v0, "phone"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    return-object v0
.end method

.method private getWlanDns()[Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v9, 0x2

    .line 1025
    new-array v3, v9, [Ljava/lang/String;

    .line 1026
    .local v3, "dnsInfo":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v9, :cond_0

    .line 1027
    const-string v7, "0.0.0.0"

    aput-object v7, v3, v5

    .line 1026
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1030
    :cond_0
    :try_start_0
    iget-object v7, p0, Lcom/qti/dpm/DpmService;->mContext:Landroid/content/Context;

    const-string v8, "connectivity"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 1032
    .local v1, "cm":Landroid/net/ConnectivityManager;
    if-eqz v1, :cond_1

    .line 1033
    const/4 v7, 0x1

    invoke-virtual {v1, v7}, Landroid/net/ConnectivityManager;->getLinkProperties(I)Landroid/net/LinkProperties;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/LinkProperties;->getDnses()Ljava/util/Collection;

    move-result-object v2

    .line 1034
    .local v2, "dnsAddress":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/net/InetAddress;>;"
    const/4 v5, 0x0

    .line 1035
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    .line 1036
    .local v0, "addr":Ljava/net/InetAddress;
    if-lt v5, v9, :cond_2

    .line 1038
    const-string v7, "SERVICE"

    const-string v8, "getWlanDns: Max dns addrs reached"

    invoke-static {v7, v8}, Lcom/qti/dpm/DpmService;->dlogi(Ljava/lang/String;Ljava/lang/String;)V

    .line 1054
    .end local v0    # "addr":Ljava/net/InetAddress;
    .end local v1    # "cm":Landroid/net/ConnectivityManager;
    .end local v2    # "dnsAddress":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/net/InetAddress;>;"
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_1
    :goto_2
    return-object v3

    .line 1041
    .restart local v0    # "addr":Ljava/net/InetAddress;
    .restart local v1    # "cm":Landroid/net/ConnectivityManager;
    .restart local v2    # "dnsAddress":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/net/InetAddress;>;"
    .restart local v6    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v5
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 1042
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1046
    .end local v0    # "addr":Ljava/net/InetAddress;
    .end local v1    # "cm":Landroid/net/ConnectivityManager;
    .end local v2    # "dnsAddress":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/net/InetAddress;>;"
    .end local v6    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v4

    .line 1047
    .local v4, "ex":Ljava/lang/ArrayIndexOutOfBoundsException;
    const-string v7, "SERVICE"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " getWlanDns caught out of bound exception: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 1048
    .end local v4    # "ex":Ljava/lang/ArrayIndexOutOfBoundsException;
    :catch_1
    move-exception v4

    .line 1049
    .local v4, "ex":Ljava/lang/NullPointerException;
    const-string v7, "SERVICE"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " getWlanDns caught null ptr exception: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 1050
    .end local v4    # "ex":Ljava/lang/NullPointerException;
    :catch_2
    move-exception v4

    .line 1051
    .local v4, "ex":Ljava/lang/Exception;
    const-string v7, "SERVICE"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " getWlanDns caught unexpected exception: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 1052
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method private handleFeatureStatusSetResponse(Landroid/os/Parcel;)V
    .locals 0
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 761
    return-void
.end method

.method private static logd(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1182
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmMsg;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1183
    return-void
.end method

.method private static loge(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1194
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmMsg;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1195
    return-void
.end method

.method private static logi(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1188
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmMsg;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 1189
    return-void
.end method

.method private static logv(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1185
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmMsg;->logv(Ljava/lang/String;Ljava/lang/String;)V

    .line 1186
    return-void
.end method

.method private static logw(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1191
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmMsg;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 1192
    return-void
.end method

.method private nsrmConfigRefresh()Z
    .locals 3

    .prologue
    .line 1015
    const/4 v1, 0x5

    invoke-static {v1}, Lcom/qti/dpm/DpmRequest;->obtain(I)Lcom/qti/dpm/DpmRequest;

    move-result-object v0

    .line 1016
    .local v0, "rr":Lcom/qti/dpm/DpmRequest;
    if-nez v0, :cond_0

    .line 1017
    const-string v1, "SERVICE"

    const-string v2, "nsrmConfigRefresh: rr=NULL"

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 1018
    const/4 v1, 0x0

    .line 1021
    :goto_0
    return v1

    .line 1020
    :cond_0
    invoke-virtual {p0, v0}, Lcom/qti/dpm/DpmService;->send(Lcom/qti/dpm/DpmRequest;)V

    .line 1021
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private postDpmdUpInit()V
    .locals 4

    .prologue
    .line 739
    const-string v2, "SERVICE"

    const-string v3, "starting initialization of components that require dpmd to have started"

    invoke-static {v2, v3}, Lcom/qti/dpm/DpmService;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 745
    invoke-virtual {p0}, Lcom/qti/dpm/DpmService;->getWlanInfo()Lcom/qti/dpm/DpmService$DpmWifiInfo;

    move-result-object v0

    .line 746
    .local v0, "dpmWifiInfo":Lcom/qti/dpm/DpmService$DpmWifiInfo;
    if-eqz v0, :cond_0

    .line 747
    invoke-direct {p0, v0}, Lcom/qti/dpm/DpmService;->sendWifiStatus(Lcom/qti/dpm/DpmService$DpmWifiInfo;)V

    .line 749
    :cond_0
    invoke-virtual {p0}, Lcom/qti/dpm/DpmService;->getWwanInfo()Lcom/qti/dpm/DpmService$DpmWwanInfo;

    move-result-object v1

    .line 750
    .local v1, "dpmWwanInfo":Lcom/qti/dpm/DpmService$DpmWwanInfo;
    if-eqz v1, :cond_1

    .line 751
    invoke-direct {p0, v1}, Lcom/qti/dpm/DpmService;->sendWwanStatus(Lcom/qti/dpm/DpmService$DpmWwanInfo;)V

    .line 753
    :cond_1
    return-void
.end method

.method private processResponse(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 840
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 841
    .local v0, "type":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 842
    invoke-direct {p0, p1}, Lcom/qti/dpm/DpmService;->processUnsolicited(Landroid/os/Parcel;)V

    .line 849
    :goto_0
    return-void

    .line 843
    :cond_0
    if-nez v0, :cond_1

    .line 844
    invoke-direct {p0, p1}, Lcom/qti/dpm/DpmService;->processSolicited(Landroid/os/Parcel;)V

    goto :goto_0

    .line 846
    :cond_1
    const-string v1, "SERVICE"

    const-string v2, "malformed message, expected RESPONSE_UNSOLICITED or RESPONSE_SOLICITED, rejecting"

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->dlogw(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private processSolicited(Landroid/os/Parcel;)V
    .locals 6
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 866
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 867
    .local v2, "serial":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 869
    .local v0, "error":I
    invoke-direct {p0, v2}, Lcom/qti/dpm/DpmService;->findAndRemoveRequestFromList(I)Lcom/qti/dpm/DpmRequest;

    move-result-object v1

    .line 870
    .local v1, "rr":Lcom/qti/dpm/DpmRequest;
    if-nez v1, :cond_0

    .line 871
    const-string v3, "SERVICE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected solicited response! sn: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " error: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 881
    :goto_0
    return-void

    .line 875
    :cond_0
    if-eqz v0, :cond_1

    .line 876
    invoke-virtual {v1, v0}, Lcom/qti/dpm/DpmRequest;->onError(I)V

    .line 877
    invoke-virtual {v1}, Lcom/qti/dpm/DpmRequest;->release()V

    goto :goto_0

    .line 880
    :cond_1
    invoke-virtual {v1}, Lcom/qti/dpm/DpmRequest;->release()V

    goto :goto_0
.end method

.method private processUnsolicited(Landroid/os/Parcel;)V
    .locals 4
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 884
    const-string v1, "SERVICE"

    const-string v2, "processUnsolicited called"

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->dlogi(Ljava/lang/String;Ljava/lang/String;)V

    .line 887
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 888
    .local v0, "response":I
    packed-switch v0, :pswitch_data_0

    .line 894
    const-string v1, "SERVICE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "UNKOWN Unsolicited Event "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 896
    :goto_0
    return-void

    .line 890
    :pswitch_0
    const-string v1, "SERVICE"

    const-string v2, "DPM_S_RESP_SET_FEATURE_PREF received"

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->rlog(Ljava/lang/String;Ljava/lang/String;)V

    .line 891
    invoke-direct {p0, p1}, Lcom/qti/dpm/DpmService;->handleFeatureStatusSetResponse(Landroid/os/Parcel;)V

    goto :goto_0

    .line 888
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method private static readDPMMessage(Ljava/io/InputStream;[B)I
    .locals 8
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 581
    const/4 v2, 0x0

    .line 582
    .local v2, "offset":I
    const/4 v3, 0x4

    .line 584
    .local v3, "remaining":I
    :cond_0
    invoke-virtual {p0, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 586
    .local v0, "countRead":I
    if-gez v0, :cond_1

    .line 587
    const-string v5, "SERVICE"

    const-string v6, "Hit EOS reading message length"

    invoke-static {v5, v6}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    move v1, v4

    .line 615
    :goto_0
    return v1

    .line 591
    :cond_1
    add-int/2addr v2, v0

    .line 592
    sub-int/2addr v3, v0

    .line 593
    if-gtz v3, :cond_0

    .line 595
    const/4 v5, 0x0

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x18

    const/4 v6, 0x1

    aget-byte v6, p1, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x10

    or-int/2addr v5, v6

    const/4 v6, 0x2

    aget-byte v6, p1, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v5, v6

    const/4 v6, 0x3

    aget-byte v6, p1, v6

    and-int/lit16 v6, v6, 0xff

    or-int v1, v5, v6

    .line 600
    .local v1, "messageLength":I
    const/4 v2, 0x0

    .line 601
    move v3, v1

    .line 603
    :cond_2
    invoke-virtual {p0, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 605
    if-gez v0, :cond_3

    .line 606
    const-string v5, "SERVICE"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Hit EOS reading message.  messageLength="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " remaining="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    move v1, v4

    .line 608
    goto :goto_0

    .line 611
    :cond_3
    add-int/2addr v2, v0

    .line 612
    sub-int/2addr v3, v0

    .line 613
    if-gtz v3, :cond_2

    goto :goto_0
.end method

.method private requestFeatureSettings(I)Z
    .locals 5
    .param p1, "featureId"    # I

    .prologue
    const/4 v1, 0x1

    .line 779
    invoke-static {v1}, Lcom/qti/dpm/DpmRequest;->obtain(I)Lcom/qti/dpm/DpmRequest;

    move-result-object v0

    .line 780
    .local v0, "rr":Lcom/qti/dpm/DpmRequest;
    if-nez v0, :cond_0

    .line 781
    const-string v1, "SERVICE"

    const-string v2, "requestFeatureSettings: rr=NULL"

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 782
    const/4 v1, 0x0

    .line 788
    :goto_0
    return v1

    .line 784
    :cond_0
    iget-object v2, v0, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 785
    iget-object v2, v0, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v2, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 786
    const-string v2, "SERVICE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "requestFeatureSettings: featureId: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/qti/dpm/DpmService;->dlogi(Ljava/lang/String;Ljava/lang/String;)V

    .line 787
    invoke-virtual {p0, v0}, Lcom/qti/dpm/DpmService;->send(Lcom/qti/dpm/DpmRequest;)V

    goto :goto_0
.end method

.method private requestFeatureSettingsChange(II)Z
    .locals 4
    .param p1, "featureId"    # I
    .param p2, "newValue"    # I

    .prologue
    .line 764
    const/4 v1, 0x3

    invoke-static {v1}, Lcom/qti/dpm/DpmRequest;->obtain(I)Lcom/qti/dpm/DpmRequest;

    move-result-object v0

    .line 765
    .local v0, "rr":Lcom/qti/dpm/DpmRequest;
    if-nez v0, :cond_0

    .line 766
    const-string v1, "SERVICE"

    const-string v2, "requestFeatureSettingsChange: rr=NULL"

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 767
    const/4 v1, 0x0

    .line 775
    :goto_0
    return v1

    .line 769
    :cond_0
    iget-object v1, v0, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 770
    iget-object v1, v0, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 771
    iget-object v1, v0, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 772
    const-string v1, "SERVICE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestFeatureSettingsChange: feature id: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " new value: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->dlogi(Ljava/lang/String;Ljava/lang/String;)V

    .line 774
    invoke-virtual {p0, v0}, Lcom/qti/dpm/DpmService;->send(Lcom/qti/dpm/DpmRequest;)V

    .line 775
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private static rlog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1216
    invoke-static {p0, p1}, Lcom/qti/dpm/DpmMsg;->rlog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1217
    return-void
.end method

.method private sendInitReq()Z
    .locals 3

    .prologue
    .line 1172
    const/16 v1, 0x8

    invoke-static {v1}, Lcom/qti/dpm/DpmRequest;->obtain(I)Lcom/qti/dpm/DpmRequest;

    move-result-object v0

    .line 1173
    .local v0, "rr":Lcom/qti/dpm/DpmRequest;
    if-nez v0, :cond_0

    .line 1174
    const-string v1, "SERVICE"

    const-string v2, "sendinitReq: rr=NULL"

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 1175
    const/4 v1, 0x0

    .line 1178
    :goto_0
    return v1

    .line 1177
    :cond_0
    invoke-virtual {p0, v0}, Lcom/qti/dpm/DpmService;->send(Lcom/qti/dpm/DpmRequest;)V

    .line 1178
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private sendScreenState(Z)V
    .locals 4
    .param p1, "state"    # Z

    .prologue
    const/4 v1, 0x1

    .line 1146
    const/16 v2, 0xd

    invoke-static {v2}, Lcom/qti/dpm/DpmRequest;->obtain(I)Lcom/qti/dpm/DpmRequest;

    move-result-object v0

    .line 1147
    .local v0, "rr":Lcom/qti/dpm/DpmRequest;
    if-nez v0, :cond_0

    .line 1148
    const-string v1, "SERVICE"

    const-string v2, "sendScreenState: rr = NULL"

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 1156
    :goto_0
    return-void

    .line 1151
    :cond_0
    iget-object v2, v0, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 1152
    iget-object v2, v0, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    if-ne p1, v1, :cond_1

    :goto_1
    invoke-virtual {v2, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 1154
    const-string v1, "SERVICE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendScreenState: state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->dlogi(Ljava/lang/String;Ljava/lang/String;)V

    .line 1155
    invoke-virtual {p0, v0}, Lcom/qti/dpm/DpmService;->send(Lcom/qti/dpm/DpmRequest;)V

    goto :goto_0

    .line 1152
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private sendTetheringState(Z)V
    .locals 4
    .param p1, "state"    # Z

    .prologue
    const/4 v1, 0x1

    .line 1159
    const/16 v2, 0xe

    invoke-static {v2}, Lcom/qti/dpm/DpmRequest;->obtain(I)Lcom/qti/dpm/DpmRequest;

    move-result-object v0

    .line 1160
    .local v0, "rr":Lcom/qti/dpm/DpmRequest;
    if-nez v0, :cond_0

    .line 1161
    const-string v1, "SERVICE"

    const-string v2, "sendTetheringState: rr = NULL"

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 1169
    :goto_0
    return-void

    .line 1164
    :cond_0
    iget-object v2, v0, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 1165
    iget-object v2, v0, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    if-ne p1, v1, :cond_1

    :goto_1
    invoke-virtual {v2, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 1167
    const-string v1, "SERVICE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendTetheringState: state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/qti/dpm/DpmService;->dlogi(Ljava/lang/String;Ljava/lang/String;)V

    .line 1168
    invoke-virtual {p0, v0}, Lcom/qti/dpm/DpmService;->send(Lcom/qti/dpm/DpmRequest;)V

    goto :goto_0

    .line 1165
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private sendWifiStatus(Lcom/qti/dpm/DpmService$DpmWifiInfo;)V
    .locals 12
    .param p1, "dpmWifiInfo"    # Lcom/qti/dpm/DpmService$DpmWifiInfo;

    .prologue
    .line 1058
    iget-object v9, p0, Lcom/qti/dpm/DpmService;->mWifiManager:Landroid/net/wifi/WifiManager;

    if-eqz v9, :cond_3

    if-eqz p1, :cond_3

    .line 1060
    :try_start_0
    invoke-direct {p0}, Lcom/qti/dpm/DpmService;->getWlanDns()[Ljava/lang/String;

    move-result-object v2

    .line 1062
    .local v2, "dnsInfo":[Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    const-string v9, " "

    invoke-direct {v1, v9}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 1063
    .local v1, "dnsAddrs":Ljava/lang/String;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_0

    aget-object v3, v0, v5

    .line 1064
    .local v3, "dnsStr":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1063
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1067
    .end local v3    # "dnsStr":Ljava/lang/String;
    :cond_0
    const-string v9, "SERVICE"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "sendWifiStatus - subType: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->subType:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " networkState: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->networkState:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " softApState: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->softApState:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " rssi="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->rssi:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " ssid="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ssid:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " bssid="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->bssid:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " ipV4Addr="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ipAddrV4:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " ifNameV4="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ifNameV4:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " ipAddrV6="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ipAddrV6:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " ifNameV6="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ifNameV6:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " DNS addrs="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/qti/dpm/DpmService;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 1080
    const/16 v9, 0x9

    invoke-static {v9}, Lcom/qti/dpm/DpmRequest;->obtain(I)Lcom/qti/dpm/DpmRequest;

    move-result-object v8

    .line 1081
    .local v8, "rr":Lcom/qti/dpm/DpmRequest;
    if-nez v8, :cond_1

    .line 1082
    const-string v9, "SERVICE"

    const-string v10, "updateWlanStatus: rr=NULL - no updated"

    invoke-static {v9, v10}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 1106
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "dnsAddrs":Ljava/lang/String;
    .end local v2    # "dnsInfo":[Ljava/lang/String;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v8    # "rr":Lcom/qti/dpm/DpmRequest;
    :goto_1
    return-void

    .line 1086
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "dnsAddrs":Ljava/lang/String;
    .restart local v2    # "dnsInfo":[Ljava/lang/String;
    .restart local v5    # "i$":I
    .restart local v6    # "len$":I
    .restart local v8    # "rr":Lcom/qti/dpm/DpmRequest;
    :cond_1
    iget-object v9, v8, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget v10, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->subType:I

    invoke-virtual {v9, v10}, Landroid/os/Parcel;->writeInt(I)V

    .line 1087
    iget-object v9, v8, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget v10, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->networkState:I

    invoke-virtual {v9, v10}, Landroid/os/Parcel;->writeInt(I)V

    .line 1088
    iget-object v9, v8, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget v10, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->softApState:I

    invoke-virtual {v9, v10}, Landroid/os/Parcel;->writeInt(I)V

    .line 1089
    iget-object v9, v8, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget v10, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->rssi:I

    invoke-virtual {v9, v10}, Landroid/os/Parcel;->writeInt(I)V

    .line 1090
    iget-object v9, v8, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget-object v10, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ssid:Ljava/lang/String;

    invoke-virtual {v9, v10}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1091
    iget-object v9, v8, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget-object v10, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->bssid:Ljava/lang/String;

    invoke-virtual {v9, v10}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1092
    iget-object v9, v8, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget-object v10, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ipAddrV4:Ljava/lang/String;

    invoke-virtual {v9, v10}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1093
    iget-object v9, v8, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget-object v10, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ifNameV4:Ljava/lang/String;

    invoke-virtual {v9, v10}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1094
    iget-object v9, v8, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget-object v10, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ipAddrV6:Ljava/lang/String;

    invoke-virtual {v9, v10}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1095
    iget-object v9, v8, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget-object v10, p1, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ifNameV6:Ljava/lang/String;

    invoke-virtual {v9, v10}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1096
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    const/4 v9, 0x2

    if-ge v4, v9, :cond_2

    .line 1097
    iget-object v9, v8, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    aget-object v10, v2, v4

    invoke-virtual {v9, v10}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1096
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 1099
    :cond_2
    invoke-virtual {p0, v8}, Lcom/qti/dpm/DpmService;->send(Lcom/qti/dpm/DpmRequest;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1100
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "dnsAddrs":Ljava/lang/String;
    .end local v2    # "dnsInfo":[Ljava/lang/String;
    .end local v4    # "i":I
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v8    # "rr":Lcom/qti/dpm/DpmRequest;
    :catch_0
    move-exception v7

    .line 1101
    .local v7, "npe":Ljava/lang/NullPointerException;
    const-string v9, "SERVICE"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "sendWifiStatus: null pointer"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1104
    .end local v7    # "npe":Ljava/lang/NullPointerException;
    :cond_3
    const-string v9, "SERVICE"

    const-string v10, "sendWlanStatus: null mWifiManager or dpmWifiInfo"

    invoke-static {v9, v10}, Lcom/qti/dpm/DpmService;->dlogw(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private sendWwanStatus(Lcom/qti/dpm/DpmService$DpmWwanInfo;)V
    .locals 5
    .param p1, "dpmWwanInfo"    # Lcom/qti/dpm/DpmService$DpmWwanInfo;

    .prologue
    .line 1109
    iget-object v2, p0, Lcom/qti/dpm/DpmService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    if-eqz v2, :cond_1

    if-eqz p1, :cond_1

    .line 1111
    const/16 v2, 0xa

    :try_start_0
    invoke-static {v2}, Lcom/qti/dpm/DpmRequest;->obtain(I)Lcom/qti/dpm/DpmRequest;

    move-result-object v1

    .line 1112
    .local v1, "rr":Lcom/qti/dpm/DpmRequest;
    if-nez v1, :cond_0

    .line 1113
    const-string v2, "SERVICE"

    const-string v3, "sendWwanStatus: rr=NULL - no updated"

    invoke-static {v2, v3}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 1115
    :cond_0
    const-string v2, "SERVICE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sendWwanStatus type="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->networkType:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " state="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->networkState:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " nwType="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->nwType:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " roaming="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->roaming:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " apn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->apn:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ipV4Addr="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ipAddrV4:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ifNameV4="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ifNameV4:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ipV6Addr="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ipAddrV6:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ifNameV6="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ifNameV6:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " mccMnc="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->mccMnc:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/qti/dpm/DpmService;->dlogi(Ljava/lang/String;Ljava/lang/String;)V

    .line 1125
    iget-object v2, v1, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget v3, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->networkType:I

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1126
    iget-object v2, v1, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget v3, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->networkState:I

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1127
    iget-object v2, v1, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget v3, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->nwType:I

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1128
    iget-object v2, v1, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget v3, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->roaming:I

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1129
    iget-object v2, v1, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget v3, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->apn:I

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1130
    iget-object v2, v1, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget-object v3, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ipAddrV4:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1131
    iget-object v2, v1, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget-object v3, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ifNameV4:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1132
    iget-object v2, v1, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget-object v3, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ipAddrV6:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1133
    iget-object v2, v1, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget-object v3, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ifNameV6:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1134
    iget-object v2, v1, Lcom/qti/dpm/DpmRequest;->mp:Landroid/os/Parcel;

    iget-object v3, p1, Lcom/qti/dpm/DpmService$DpmWwanInfo;->mccMnc:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1135
    invoke-virtual {p0, v1}, Lcom/qti/dpm/DpmService;->send(Lcom/qti/dpm/DpmRequest;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1143
    .end local v1    # "rr":Lcom/qti/dpm/DpmRequest;
    :goto_0
    return-void

    .line 1137
    :catch_0
    move-exception v0

    .line 1138
    .local v0, "npe":Ljava/lang/NullPointerException;
    const-string v2, "SERVICE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sendWwanStatus: null pointer "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1141
    .end local v0    # "npe":Ljava/lang/NullPointerException;
    :cond_1
    const-string v2, "SERVICE"

    const-string v3, "sendWwanStatus: null TelephonyManager or dpmWwanInfo"

    invoke-static {v2, v3}, Lcom/qti/dpm/DpmService;->dlogw(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private setPolicyConfigUpdateBusy(IZ)V
    .locals 3
    .param p1, "policyType"    # I
    .param p2, "tryLater"    # Z

    .prologue
    .line 926
    packed-switch p1, :pswitch_data_0

    .line 936
    :goto_0
    return-void

    .line 928
    :pswitch_0
    monitor-enter p0

    .line 929
    :try_start_0
    sput-boolean p2, Lcom/qti/dpm/DpmService;->isNsrmConfigUpdateBusy:Z

    .line 930
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 931
    const-string v0, "SERVICE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isNsrmConfigUpdateBusy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/qti/dpm/DpmService;->isNsrmConfigUpdateBusy:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/qti/dpm/DpmService;->dlogv(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 930
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 926
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private updateNsrmConfig(Ljava/lang/String;)I
    .locals 1
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 939
    const/4 v0, -0x1

    .line 960
    .local v0, "retVal":I
    return v0
.end method


# virtual methods
.method getWlanInfo()Lcom/qti/dpm/DpmService$DpmWifiInfo;
    .locals 13

    .prologue
    const/4 v12, 0x1

    .line 222
    new-instance v2, Lcom/qti/dpm/DpmService$DpmWifiInfo;

    invoke-direct {v2, p0}, Lcom/qti/dpm/DpmService$DpmWifiInfo;-><init>(Lcom/qti/dpm/DpmService;)V

    .line 223
    .local v2, "dpmWifiInfo":Lcom/qti/dpm/DpmService$DpmWifiInfo;
    iget-object v10, p0, Lcom/qti/dpm/DpmService;->mContext:Landroid/content/Context;

    const-string v11, "connectivity"

    invoke-virtual {v10, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 225
    .local v1, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v1, v12}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v7

    .line 226
    .local v7, "networkInfo":Landroid/net/NetworkInfo;
    if-nez v7, :cond_1

    sget-object v10, Landroid/net/NetworkInfo$State;->UNKNOWN:Landroid/net/NetworkInfo$State;

    :goto_0
    invoke-direct {p0, v10}, Lcom/qti/dpm/DpmService;->NetworkStateToInt(Landroid/net/NetworkInfo$State;)I

    move-result v10

    iput v10, v2, Lcom/qti/dpm/DpmService$DpmWifiInfo;->networkState:I

    .line 230
    const/4 v10, 0x1

    :try_start_0
    invoke-virtual {v1, v10}, Landroid/net/ConnectivityManager;->getLinkProperties(I)Landroid/net/LinkProperties;

    move-result-object v6

    .line 231
    .local v6, "lp":Landroid/net/LinkProperties;
    invoke-virtual {v6}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/Collection;

    move-result-object v5

    .line 232
    .local v5, "linkAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/net/LinkAddress;>;"
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/LinkAddress;

    .line 233
    .local v4, "linkAddress":Landroid/net/LinkAddress;
    invoke-virtual {v4}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 234
    .local v0, "addr":Ljava/net/InetAddress;
    instance-of v10, v0, Ljava/net/Inet4Address;

    if-eqz v10, :cond_2

    .line 235
    invoke-virtual {v0}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v10

    if-nez v10, :cond_0

    invoke-virtual {v0}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v10

    if-nez v10, :cond_0

    .line 236
    invoke-virtual {v6}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v2, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ifNameV4:Ljava/lang/String;

    .line 237
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v2, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ipAddrV4:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 255
    .end local v0    # "addr":Ljava/net/InetAddress;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "linkAddress":Landroid/net/LinkAddress;
    .end local v5    # "linkAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/net/LinkAddress;>;"
    .end local v6    # "lp":Landroid/net/LinkProperties;
    :catch_0
    move-exception v8

    .line 256
    .local v8, "nexp":Ljava/lang/NullPointerException;
    const-string v10, "SERVICE"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "getWlanInfo(): Null Pointer Exception"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    const/4 v2, 0x0

    .line 259
    .end local v2    # "dpmWifiInfo":Lcom/qti/dpm/DpmService$DpmWifiInfo;
    .end local v8    # "nexp":Ljava/lang/NullPointerException;
    :goto_2
    return-object v2

    .line 226
    .restart local v2    # "dpmWifiInfo":Lcom/qti/dpm/DpmService$DpmWifiInfo;
    :cond_1
    invoke-virtual {v7}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v10

    goto :goto_0

    .line 240
    .restart local v0    # "addr":Ljava/net/InetAddress;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "linkAddress":Landroid/net/LinkAddress;
    .restart local v5    # "linkAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/net/LinkAddress;>;"
    .restart local v6    # "lp":Landroid/net/LinkProperties;
    :cond_2
    :try_start_1
    instance-of v10, v0, Ljava/net/Inet6Address;

    if-eqz v10, :cond_0

    .line 241
    invoke-virtual {v0}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v10

    if-nez v10, :cond_0

    invoke-virtual {v0}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v10

    if-nez v10, :cond_0

    .line 242
    invoke-virtual {v6}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v2, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ifNameV6:Ljava/lang/String;

    .line 243
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v2, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ipAddrV6:Ljava/lang/String;

    goto :goto_1

    .line 247
    .end local v0    # "addr":Ljava/net/InetAddress;
    .end local v4    # "linkAddress":Landroid/net/LinkAddress;
    :cond_3
    iget-object v10, p0, Lcom/qti/dpm/DpmService;->mWifiManager:Landroid/net/wifi/WifiManager;

    if-eqz v10, :cond_4

    .line 248
    iget-object v10, p0, Lcom/qti/dpm/DpmService;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v10}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v9

    .line 249
    .local v9, "wi":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v9}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/net/wifi/WifiInfo;->removeDoubleQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v2, Lcom/qti/dpm/DpmService$DpmWifiInfo;->ssid:Ljava/lang/String;

    .line 250
    invoke-virtual {v9}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v2, Lcom/qti/dpm/DpmService$DpmWifiInfo;->bssid:Ljava/lang/String;

    .line 251
    invoke-virtual {v9}, Landroid/net/wifi/WifiInfo;->getRssi()I

    move-result v10

    iput v10, v2, Lcom/qti/dpm/DpmService$DpmWifiInfo;->rssi:I

    .line 252
    iget-object v10, p0, Lcom/qti/dpm/DpmService;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v10}, Landroid/net/wifi/WifiManager;->getWifiApState()I

    move-result v10

    iput v10, v2, Lcom/qti/dpm/DpmService$DpmWifiInfo;->softApState:I

    .line 254
    .end local v9    # "wi":Landroid/net/wifi/WifiInfo;
    :cond_4
    const/16 v10, 0x15

    iput v10, v2, Lcom/qti/dpm/DpmService$DpmWifiInfo;->subType:I
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method getWwanInfo()Lcom/qti/dpm/DpmService$DpmWwanInfo;
    .locals 20

    .prologue
    .line 263
    new-instance v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/qti/dpm/DpmService$DpmWwanInfo;-><init>(Lcom/qti/dpm/DpmService;)V

    .line 265
    .local v5, "dpmWwanInfo":Lcom/qti/dpm/DpmService$DpmWwanInfo;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService;->mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    const-string v18, "connectivity"

    invoke-virtual/range {v17 .. v18}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/ConnectivityManager;

    .line 268
    .local v4, "cm":Landroid/net/ConnectivityManager;
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v13

    .line 270
    .local v13, "networkInfo":Landroid/net/NetworkInfo;
    if-nez v13, :cond_3

    sget-object v17, Landroid/net/NetworkInfo$State;->UNKNOWN:Landroid/net/NetworkInfo$State;

    :goto_0
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/qti/dpm/DpmService;->NetworkStateToInt(Landroid/net/NetworkInfo$State;)I

    move-result v17

    move/from16 v0, v17

    iput v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->networkState:I

    .line 274
    invoke-virtual {v13}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v17

    move/from16 v0, v17

    iput v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->subType:I

    .line 276
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Landroid/net/ConnectivityManager;->getLinkProperties(I)Landroid/net/LinkProperties;

    move-result-object v12

    .line 277
    .local v12, "lp":Landroid/net/LinkProperties;
    invoke-virtual {v12}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/Collection;

    move-result-object v11

    .line 278
    .local v11, "linkAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/net/LinkAddress;>;"
    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/net/LinkAddress;

    .line 279
    .local v10, "linkAddress":Landroid/net/LinkAddress;
    invoke-virtual {v10}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v2

    .line 280
    .local v2, "addr":Ljava/net/InetAddress;
    instance-of v0, v2, Ljava/net/Inet4Address;

    move/from16 v17, v0

    if-eqz v17, :cond_4

    .line 281
    invoke-virtual {v2}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v17

    if-nez v17, :cond_0

    invoke-virtual {v2}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v17

    if-nez v17, :cond_0

    .line 282
    invoke-virtual {v12}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ifNameV4:Ljava/lang/String;

    .line 283
    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ipAddrV4:Ljava/lang/String;

    .line 308
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    move-object/from16 v17, v0

    if-eqz v17, :cond_1

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/telephony/TelephonyManager;->isNetworkRoaming()Z

    move-result v17

    if-eqz v17, :cond_9

    const/16 v17, 0x1

    :goto_2
    move/from16 v0, v17

    iput v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->roaming:I

    .line 310
    move-object/from16 v0, p0

    iget v0, v0, Lcom/qti/dpm/DpmService;->mNetworkType:I

    move/from16 v17, v0

    move/from16 v0, v17

    iput v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->nwType:I

    .line 311
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->mccMnc:Ljava/lang/String;

    .line 313
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/qti/dpm/DpmService;->apnTypeValue:I

    move/from16 v17, v0

    move/from16 v0, v17

    iput v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->apn:I
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 315
    .end local v2    # "addr":Ljava/net/InetAddress;
    .end local v4    # "cm":Landroid/net/ConnectivityManager;
    .end local v10    # "linkAddress":Landroid/net/LinkAddress;
    .end local v11    # "linkAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/net/LinkAddress;>;"
    .end local v12    # "lp":Landroid/net/LinkProperties;
    .end local v13    # "networkInfo":Landroid/net/NetworkInfo;
    :catch_0
    move-exception v14

    .line 316
    .local v14, "nexp":Ljava/lang/NullPointerException;
    const-string v17, "SERVICE"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "getWwanInfo(): Null Pointer Exception"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    const/4 v5, 0x0

    .line 319
    .end local v5    # "dpmWwanInfo":Lcom/qti/dpm/DpmService$DpmWwanInfo;
    .end local v14    # "nexp":Ljava/lang/NullPointerException;
    :cond_2
    return-object v5

    .line 270
    .restart local v4    # "cm":Landroid/net/ConnectivityManager;
    .restart local v5    # "dpmWwanInfo":Lcom/qti/dpm/DpmService$DpmWwanInfo;
    .restart local v13    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_3
    :try_start_1
    invoke-virtual {v13}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v17

    goto/16 :goto_0

    .line 286
    .restart local v2    # "addr":Ljava/net/InetAddress;
    .restart local v10    # "linkAddress":Landroid/net/LinkAddress;
    .restart local v11    # "linkAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/net/LinkAddress;>;"
    .restart local v12    # "lp":Landroid/net/LinkProperties;
    :cond_4
    instance-of v0, v2, Ljava/net/Inet6Address;

    move/from16 v17, v0

    if-eqz v17, :cond_0

    .line 287
    invoke-virtual {v2}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v17

    if-nez v17, :cond_5

    invoke-virtual {v2}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v17

    if-nez v17, :cond_5

    .line 288
    invoke-virtual {v12}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ifNameV6:Ljava/lang/String;

    .line 289
    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ipAddrV6:Ljava/lang/String;

    .line 291
    :cond_5
    invoke-virtual {v12}, Landroid/net/LinkProperties;->getStackedLinks()Ljava/util/Collection;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_6
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/net/LinkProperties;

    .line 292
    .local v9, "link":Landroid/net/LinkProperties;
    invoke-virtual {v9}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v17

    const-string v18, "clat4"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 293
    invoke-virtual {v9}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/Collection;

    move-result-object v16

    .line 294
    .local v16, "stackedLinkAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/net/LinkAddress;>;"
    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_7
    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/net/LinkAddress;

    .line 295
    .local v15, "stackedLinkAddress":Landroid/net/LinkAddress;
    invoke-virtual {v15}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v3

    .line 296
    .local v3, "address":Ljava/net/InetAddress;
    instance-of v0, v3, Ljava/net/Inet4Address;

    move/from16 v17, v0

    if-eqz v17, :cond_7

    .line 297
    invoke-virtual {v3}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v17

    if-nez v17, :cond_7

    invoke-virtual {v3}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v17

    if-nez v17, :cond_7

    .line 298
    invoke-virtual {v9}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ifNameV4:Ljava/lang/String;

    .line 299
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v5, Lcom/qti/dpm/DpmService$DpmWwanInfo;->ipAddrV4:Ljava/lang/String;

    goto :goto_4

    .line 304
    .end local v3    # "address":Ljava/net/InetAddress;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v15    # "stackedLinkAddress":Landroid/net/LinkAddress;
    .end local v16    # "stackedLinkAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/net/LinkAddress;>;"
    :cond_8
    const-string v17, "SERVICE"

    const-string v18, "no clat4 interface present for ipv6 address"

    invoke-static/range {v17 .. v18}, Lcom/qti/dpm/DpmService;->logd(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 309
    .end local v9    # "link":Landroid/net/LinkProperties;
    :cond_9
    const/16 v17, 0x0

    goto/16 :goto_2
.end method

.method declared-synchronized send(Lcom/qti/dpm/DpmRequest;)V
    .locals 3
    .param p1, "rr"    # Lcom/qti/dpm/DpmRequest;

    .prologue
    .line 834
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/qti/dpm/DpmService;->mSender:Lcom/qti/dpm/DpmService$DpmSender;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, p1}, Lcom/qti/dpm/DpmService$DpmSender;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 835
    .local v0, "msg":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 836
    monitor-exit p0

    return-void

    .line 834
    .end local v0    # "msg":Landroid/os/Message;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public updatePolicy(ILjava/lang/String;)I
    .locals 6
    .param p1, "policyType"    # I
    .param p2, "filePath"    # Ljava/lang/String;

    .prologue
    .line 980
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x400

    if-le v2, v3, :cond_0

    .line 981
    const-string v2, "SERVICE"

    const-string v3, "Path length too long"

    invoke-static {v2, v3}, Lcom/qti/dpm/DpmService;->dloge(Ljava/lang/String;Ljava/lang/String;)V

    .line 982
    const/4 v2, -0x7

    .line 1010
    :goto_0
    return v2

    .line 985
    :cond_0
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    .line 987
    .local v1, "uid":I
    const-string v2, "/system/etc/dpm/"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "/data/dpm/"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    const/16 v2, 0x3e8

    if-le v1, v2, :cond_2

    .line 989
    const-string v2, "SERVICE"

    const-string v3, "This path is not allowed to access"

    invoke-static {v2, v3}, Lcom/qti/dpm/DpmService;->dloge(Ljava/lang/String;Ljava/lang/String;)V

    .line 990
    const/4 v2, -0x6

    goto :goto_0

    .line 993
    :cond_2
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 995
    .local v0, "file":Ljava/io/File;
    packed-switch p1, :pswitch_data_0

    .line 1009
    const-string v2, "SERVICE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid PolicyType: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " passed"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/qti/dpm/DpmService;->dlogw(Ljava/lang/String;Ljava/lang/String;)V

    .line 1010
    const/4 v2, -0x3

    goto :goto_0

    .line 997
    :pswitch_0
    sget-object v2, Lcom/qti/dpm/DpmService$FeatureType;->NSRM:Lcom/qti/dpm/DpmService$FeatureType;

    invoke-direct {p0, v2}, Lcom/qti/dpm/DpmService;->checkFeatureEnabled(Lcom/qti/dpm/DpmService$FeatureType;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 998
    const/4 v2, -0x4

    goto :goto_0

    .line 1001
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/32 v4, 0xc800

    cmp-long v2, v2, v4

    if-lez v2, :cond_4

    .line 1002
    const-string v2, "SERVICE"

    const-string v3, "File size not supported"

    invoke-static {v2, v3}, Lcom/qti/dpm/DpmService;->dloge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1003
    const/4 v2, -0x5

    goto :goto_0

    .line 1006
    :cond_4
    invoke-direct {p0, p2}, Lcom/qti/dpm/DpmService;->updateNsrmConfig(Ljava/lang/String;)I

    move-result v2

    goto :goto_0

    .line 995
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
