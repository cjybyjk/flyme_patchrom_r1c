.class Lcom/qti/dpm/DpmService$1;
.super Landroid/content/BroadcastReceiver;
.source "DpmService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/qti/dpm/DpmService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/qti/dpm/DpmService;


# direct methods
.method constructor <init>(Lcom/qti/dpm/DpmService;)V
    .locals 0

    .prologue
    .line 364
    iput-object p1, p0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 28
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 366
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    .line 369
    .local v2, "action":Ljava/lang/String;
    const-string v25, "android.intent.action.SCREEN_ON"

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_1

    .line 370
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/qti/dpm/DpmService;->DPM_EVENT_STATE_ON:Z

    move/from16 v26, v0

    # invokes: Lcom/qti/dpm/DpmService;->sendScreenState(Z)V
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$200(Lcom/qti/dpm/DpmService;Z)V

    .line 371
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    # setter for: Lcom/qti/dpm/DpmService;->mScreenOn:Z
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$302(Lcom/qti/dpm/DpmService;Z)Z

    .line 456
    :cond_0
    :goto_0
    return-void

    .line 372
    :cond_1
    const-string v25, "android.intent.action.SCREEN_OFF"

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 373
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/qti/dpm/DpmService;->DPM_EVENT_STATE_OFF:Z

    move/from16 v26, v0

    # invokes: Lcom/qti/dpm/DpmService;->sendScreenState(Z)V
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$200(Lcom/qti/dpm/DpmService;Z)V

    .line 374
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    # setter for: Lcom/qti/dpm/DpmService;->mScreenOn:Z
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$302(Lcom/qti/dpm/DpmService;Z)Z

    goto :goto_0

    .line 385
    :cond_2
    const-string v25, "android.intent.action.ANY_DATA_STATE"

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_5

    .line 386
    const-string v25, "apnType"

    move-object/from16 v0, p2

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 387
    .local v4, "apnType":Ljava/lang/String;
    if-nez v4, :cond_3

    .line 388
    const-string v25, "SERVICE"

    const-string v26, "DPM error getting apnType"

    # invokes: Lcom/qti/dpm/DpmService;->loge(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$400(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 392
    :cond_3
    const-string v25, "default"

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_4

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/qti/dpm/DpmService;->apnToInt:Lcom/qti/dpm/DpmService$ApnTypeToInt;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    # invokes: Lcom/qti/dpm/DpmService$ApnTypeToInt;->getApnIntValue(Ljava/lang/String;)I
    invoke-static {v0, v4}, Lcom/qti/dpm/DpmService$ApnTypeToInt;->access$600(Lcom/qti/dpm/DpmService$ApnTypeToInt;Ljava/lang/String;)I

    move-result v26

    # setter for: Lcom/qti/dpm/DpmService;->apnTypeValue:I
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$502(Lcom/qti/dpm/DpmService;I)I

    .line 394
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/qti/dpm/DpmService;->getWwanInfo()Lcom/qti/dpm/DpmService$DpmWwanInfo;

    move-result-object v7

    .line 395
    .local v7, "dpmWwanInfo":Lcom/qti/dpm/DpmService$DpmWwanInfo;
    if-eqz v7, :cond_0

    .line 396
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    # invokes: Lcom/qti/dpm/DpmService;->sendWwanStatus(Lcom/qti/dpm/DpmService$DpmWwanInfo;)V
    invoke-static {v0, v7}, Lcom/qti/dpm/DpmService;->access$700(Lcom/qti/dpm/DpmService;Lcom/qti/dpm/DpmService$DpmWwanInfo;)V

    goto/16 :goto_0

    .line 399
    .end local v7    # "dpmWwanInfo":Lcom/qti/dpm/DpmService$DpmWwanInfo;
    :cond_4
    const-string v25, "SERVICE"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "DPM currently does not support this apnType="

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    # invokes: Lcom/qti/dpm/DpmService;->dlogd(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$800(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 401
    .end local v4    # "apnType":Ljava/lang/String;
    :cond_5
    const-string v25, "android.net.conn.TETHER_STATE_CHANGED"

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_11

    .line 402
    const-string v25, "availableArray"

    move-object/from16 v0, p2

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 404
    .local v6, "available":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v25, "activeArray"

    move-object/from16 v0, p2

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 406
    .local v3, "active":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v25, "erroredArray"

    move-object/from16 v0, p2

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v8

    .line 409
    .local v8, "errored":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v25, "SERVICE"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "available = "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " active = "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " errored = "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    # invokes: Lcom/qti/dpm/DpmService;->logd(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$900(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    # getter for: Lcom/qti/dpm/DpmService;->mContext:Landroid/content/Context;
    invoke-static/range {v25 .. v25}, Lcom/qti/dpm/DpmService;->access$1000(Lcom/qti/dpm/DpmService;)Landroid/content/Context;

    move-result-object v25

    const-string v26, "connectivity"

    invoke-virtual/range {v25 .. v26}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/net/ConnectivityManager;

    .line 414
    .local v13, "mCm":Landroid/net/ConnectivityManager;
    invoke-virtual {v13}, Landroid/net/ConnectivityManager;->getTetherableWifiRegexs()[Ljava/lang/String;

    move-result-object v15

    .line 415
    .local v15, "mWifiRegexs":[Ljava/lang/String;
    invoke-virtual {v13}, Landroid/net/ConnectivityManager;->getTetherableUsbRegexs()[Ljava/lang/String;

    move-result-object v14

    .line 416
    .local v14, "mUsbRegexs":[Ljava/lang/String;
    invoke-virtual {v13}, Landroid/net/ConnectivityManager;->getTetherableBluetoothRegexs()[Ljava/lang/String;

    move-result-object v12

    .line 418
    .local v12, "mBluetoothRegexs":[Ljava/lang/String;
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_8

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .local v16, "o":Ljava/lang/String;
    move-object/from16 v22, v16

    .line 419
    check-cast v22, Ljava/lang/String;

    .line 420
    .local v22, "s":Ljava/lang/String;
    move-object v5, v15

    .local v5, "arr$":[Ljava/lang/String;
    array-length v11, v5

    .local v11, "len$":I
    const/4 v10, 0x0

    .local v10, "i$":I
    :goto_1
    if-ge v10, v11, :cond_6

    aget-object v19, v5, v10

    .line 421
    .local v19, "regex":Ljava/lang/String;
    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_7

    .line 422
    const-string v25, "SERVICE"

    const-string v26, "wifi tethered"

    # invokes: Lcom/qti/dpm/DpmService;->logd(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$900(Ljava/lang/String;Ljava/lang/String;)V

    .line 423
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    # setter for: Lcom/qti/dpm/DpmService;->wifiTethered:Z
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$1102(Lcom/qti/dpm/DpmService;Z)Z

    .line 420
    :cond_7
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 428
    .end local v5    # "arr$":[Ljava/lang/String;
    .end local v10    # "i$":I
    .end local v11    # "len$":I
    .end local v16    # "o":Ljava/lang/String;
    .end local v19    # "regex":Ljava/lang/String;
    .end local v22    # "s":Ljava/lang/String;
    :cond_8
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_9
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_b

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .local v18, "ousb":Ljava/lang/String;
    move-object/from16 v24, v18

    .line 429
    check-cast v24, Ljava/lang/String;

    .line 430
    .local v24, "susb":Ljava/lang/String;
    move-object v5, v14

    .restart local v5    # "arr$":[Ljava/lang/String;
    array-length v11, v5

    .restart local v11    # "len$":I
    const/4 v10, 0x0

    .restart local v10    # "i$":I
    :goto_2
    if-ge v10, v11, :cond_9

    aget-object v21, v5, v10

    .line 431
    .local v21, "regexusb":Ljava/lang/String;
    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_a

    .line 432
    const-string v25, "SERVICE"

    const-string v26, "usb tethered"

    # invokes: Lcom/qti/dpm/DpmService;->logd(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$900(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    # setter for: Lcom/qti/dpm/DpmService;->usbTethered:Z
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$1202(Lcom/qti/dpm/DpmService;Z)Z

    .line 430
    :cond_a
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 438
    .end local v5    # "arr$":[Ljava/lang/String;
    .end local v10    # "i$":I
    .end local v11    # "len$":I
    .end local v18    # "ousb":Ljava/lang/String;
    .end local v21    # "regexusb":Ljava/lang/String;
    .end local v24    # "susb":Ljava/lang/String;
    :cond_b
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_c
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_e

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .local v17, "obt":Ljava/lang/String;
    move-object/from16 v23, v17

    .line 439
    check-cast v23, Ljava/lang/String;

    .line 440
    .local v23, "sbt":Ljava/lang/String;
    move-object v5, v12

    .restart local v5    # "arr$":[Ljava/lang/String;
    array-length v11, v5

    .restart local v11    # "len$":I
    const/4 v10, 0x0

    .restart local v10    # "i$":I
    :goto_3
    if-ge v10, v11, :cond_c

    aget-object v20, v5, v10

    .line 441
    .local v20, "regexbt":Ljava/lang/String;
    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_d

    .line 442
    const-string v25, "SERVICE"

    const-string v26, "bluetooth tethered"

    # invokes: Lcom/qti/dpm/DpmService;->logd(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$900(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    # setter for: Lcom/qti/dpm/DpmService;->bluetoothTethered:Z
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$1302(Lcom/qti/dpm/DpmService;Z)Z

    .line 440
    :cond_d
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 448
    .end local v5    # "arr$":[Ljava/lang/String;
    .end local v10    # "i$":I
    .end local v11    # "len$":I
    .end local v17    # "obt":Ljava/lang/String;
    .end local v20    # "regexbt":Ljava/lang/String;
    .end local v23    # "sbt":Ljava/lang/String;
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    # getter for: Lcom/qti/dpm/DpmService;->wifiTethered:Z
    invoke-static/range {v25 .. v25}, Lcom/qti/dpm/DpmService;->access$1100(Lcom/qti/dpm/DpmService;)Z

    move-result v25

    if-nez v25, :cond_f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    # getter for: Lcom/qti/dpm/DpmService;->usbTethered:Z
    invoke-static/range {v25 .. v25}, Lcom/qti/dpm/DpmService;->access$1200(Lcom/qti/dpm/DpmService;)Z

    move-result v25

    if-nez v25, :cond_f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    # getter for: Lcom/qti/dpm/DpmService;->bluetoothTethered:Z
    invoke-static/range {v25 .. v25}, Lcom/qti/dpm/DpmService;->access$1300(Lcom/qti/dpm/DpmService;)Z

    move-result v25

    if-eqz v25, :cond_10

    .line 449
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/qti/dpm/DpmService;->DPM_EVENT_STATE_ON:Z

    move/from16 v26, v0

    # invokes: Lcom/qti/dpm/DpmService;->sendTetheringState(Z)V
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$1400(Lcom/qti/dpm/DpmService;Z)V

    goto/16 :goto_0

    .line 451
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qti/dpm/DpmService$1;->this$0:Lcom/qti/dpm/DpmService;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/qti/dpm/DpmService;->DPM_EVENT_STATE_OFF:Z

    move/from16 v26, v0

    # invokes: Lcom/qti/dpm/DpmService;->sendTetheringState(Z)V
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$1400(Lcom/qti/dpm/DpmService;Z)V

    goto/16 :goto_0

    .line 454
    .end local v3    # "active":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "available":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v8    # "errored":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v12    # "mBluetoothRegexs":[Ljava/lang/String;
    .end local v13    # "mCm":Landroid/net/ConnectivityManager;
    .end local v14    # "mUsbRegexs":[Ljava/lang/String;
    .end local v15    # "mWifiRegexs":[Ljava/lang/String;
    :cond_11
    const-string v25, "SERVICE"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "DPM received unexpected action: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    # invokes: Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static/range {v25 .. v26}, Lcom/qti/dpm/DpmService;->access$1500(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
