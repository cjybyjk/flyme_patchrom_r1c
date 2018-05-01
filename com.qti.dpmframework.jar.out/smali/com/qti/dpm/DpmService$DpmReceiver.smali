.class Lcom/qti/dpm/DpmService$DpmReceiver;
.super Ljava/lang/Object;
.source "DpmService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/qti/dpm/DpmService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DpmReceiver"
.end annotation


# static fields
.field private static final SUB_TYPE:Ljava/lang/String; = "REQ:RCVR"


# instance fields
.field buffer:[B

.field final synthetic this$0:Lcom/qti/dpm/DpmService;


# direct methods
.method constructor <init>(Lcom/qti/dpm/DpmService;)V
    .locals 1

    .prologue
    .line 624
    iput-object p1, p0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 625
    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/qti/dpm/DpmService$DpmReceiver;->buffer:[B

    .line 626
    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 629
    const/4 v8, 0x0

    .line 633
    .local v8, "retryCount":I
    :goto_0
    const/4 v10, 0x0

    .line 637
    .local v10, "s":Landroid/net/LocalSocket;
    :try_start_0
    const-string v14, "REQ:RCVR"

    const-string v15, "DPM creating socket"

    # invokes: Lcom/qti/dpm/DpmService;->rlog(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v14, v15}, Lcom/qti/dpm/DpmService;->access$1800(Ljava/lang/String;Ljava/lang/String;)V

    .line 638
    new-instance v11, Landroid/net/LocalSocket;

    invoke-direct {v11}, Landroid/net/LocalSocket;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 639
    .end local v10    # "s":Landroid/net/LocalSocket;
    .local v11, "s":Landroid/net/LocalSocket;
    :try_start_1
    new-instance v5, Landroid/net/LocalSocketAddress;

    const-string v14, "dpmd"

    sget-object v15, Landroid/net/LocalSocketAddress$Namespace;->RESERVED:Landroid/net/LocalSocketAddress$Namespace;

    invoke-direct {v5, v14, v15}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    .line 641
    .local v5, "l":Landroid/net/LocalSocketAddress;
    invoke-virtual {v11, v5}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_4

    .line 669
    const/4 v8, 0x0

    .line 670
    :try_start_2
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    iput-object v11, v14, Lcom/qti/dpm/DpmService;->mSocket:Landroid/net/LocalSocket;

    .line 671
    const-string v14, "REQ:RCVR"

    const-string v15, "Connected to \'dpmd\' socket"

    # invokes: Lcom/qti/dpm/DpmService;->rlog(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v14, v15}, Lcom/qti/dpm/DpmService;->access$1800(Ljava/lang/String;Ljava/lang/String;)V

    .line 672
    const/4 v14, 0x1

    sput-boolean v14, Lcom/qti/dpm/DpmService;->isDpmdUp:Z

    .line 673
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    # invokes: Lcom/qti/dpm/DpmService;->sendInitReq()Z
    invoke-static {v14}, Lcom/qti/dpm/DpmService;->access$2000(Lcom/qti/dpm/DpmService;)Z

    .line 674
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    iget-object v14, v14, Lcom/qti/dpm/DpmService;->apnToInt:Lcom/qti/dpm/DpmService$ApnTypeToInt;

    # invokes: Lcom/qti/dpm/DpmService$ApnTypeToInt;->constructApnMap()V
    invoke-static {v14}, Lcom/qti/dpm/DpmService$ApnTypeToInt;->access$2100(Lcom/qti/dpm/DpmService$ApnTypeToInt;)V

    .line 675
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    iget-object v14, v14, Lcom/qti/dpm/DpmService;->mSender:Lcom/qti/dpm/DpmService$DpmSender;

    const/4 v15, 0x3

    const-wide/16 v16, 0x3e8

    invoke-virtual/range {v14 .. v17}, Lcom/qti/dpm/DpmService$DpmSender;->sendEmptyMessageDelayed(IJ)Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_4

    .line 677
    const/4 v6, 0x0

    .line 679
    .local v6, "length":I
    :try_start_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    iget-object v14, v14, Lcom/qti/dpm/DpmService;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v14}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 684
    .local v4, "is":Ljava/io/InputStream;
    :goto_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->buffer:[B

    # invokes: Lcom/qti/dpm/DpmService;->readDPMMessage(Ljava/io/InputStream;[B)I
    invoke-static {v4, v14}, Lcom/qti/dpm/DpmService;->access$2200(Ljava/io/InputStream;[B)I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_5

    move-result v6

    .line 686
    if-gez v6, :cond_3

    .line 703
    .end local v4    # "is":Ljava/io/InputStream;
    :goto_2
    :try_start_4
    const-string v14, "REQ:RCVR"

    const-string v15, "Disconnected from \'dpmd\' socket"

    # invokes: Lcom/qti/dpm/DpmService;->rlog(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v14, v15}, Lcom/qti/dpm/DpmService;->access$1800(Ljava/lang/String;Ljava/lang/String;)V

    .line 704
    const/4 v14, 0x0

    sput-boolean v14, Lcom/qti/dpm/DpmService;->isDpmdUp:Z

    .line 705
    const/4 v14, 0x1

    sput-boolean v14, Lcom/qti/dpm/DpmService;->isDpmdDisconnected:Z

    .line 706
    const/4 v14, 0x0

    sput-boolean v14, Lcom/qti/dpm/DpmService;->isDispatched:Z
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_4

    .line 709
    :try_start_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    iget-object v14, v14, Lcom/qti/dpm/DpmService;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v14}, Landroid/net/LocalSocket;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_4

    .line 713
    :goto_3
    :try_start_6
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    const/4 v15, 0x0

    iput-object v15, v14, Lcom/qti/dpm/DpmService;->mSocket:Landroid/net/LocalSocket;

    .line 714
    invoke-static {}, Lcom/qti/dpm/DpmRequest;->resetSerial()V

    .line 717
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    iget-object v15, v14, Lcom/qti/dpm/DpmService;->mRequestsList:Ljava/util/ArrayList;

    monitor-enter v15
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_4

    .line 718
    const/4 v3, 0x0

    .local v3, "i":I
    :try_start_7
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    iget-object v14, v14, Lcom/qti/dpm/DpmService;->mRequestsList:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v12

    .local v12, "sz":I
    :goto_4
    if-ge v3, v12, :cond_4

    .line 719
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    iget-object v14, v14, Lcom/qti/dpm/DpmService;->mRequestsList:Ljava/util/ArrayList;

    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/qti/dpm/DpmRequest;

    .line 721
    .local v9, "rr":Lcom/qti/dpm/DpmRequest;
    invoke-virtual {v9}, Lcom/qti/dpm/DpmRequest;->release()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 718
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 642
    .end local v3    # "i":I
    .end local v5    # "l":Landroid/net/LocalSocketAddress;
    .end local v6    # "length":I
    .end local v9    # "rr":Lcom/qti/dpm/DpmRequest;
    .end local v11    # "s":Landroid/net/LocalSocket;
    .end local v12    # "sz":I
    .restart local v10    # "s":Landroid/net/LocalSocket;
    :catch_0
    move-exception v2

    .line 644
    .local v2, "ex":Ljava/io/IOException;
    :goto_5
    if-eqz v10, :cond_0

    .line 645
    :try_start_8
    invoke-virtual {v10}, Landroid/net/LocalSocket;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_1

    .line 653
    :cond_0
    :goto_6
    const/16 v14, 0x8

    if-ne v8, v14, :cond_2

    .line 654
    :try_start_9
    const-string v14, "REQ:RCVR"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Couldn\'t find \'dpmd\' socket after "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " times, continuing to retry silently"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    # invokes: Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v14, v15}, Lcom/qti/dpm/DpmService;->access$1500(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_1

    .line 662
    :cond_1
    :goto_7
    const-wide/16 v14, 0xfa0

    :try_start_a
    invoke-static {v14, v15}, Ljava/lang/Thread;->sleep(J)V
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_1

    .line 666
    :goto_8
    add-int/lit8 v8, v8, 0x1

    .line 667
    goto/16 :goto_0

    .line 656
    :cond_2
    if-lez v8, :cond_1

    const/16 v14, 0x8

    if-ge v8, v14, :cond_1

    .line 657
    :try_start_b
    const-string v14, "REQ:RCVR"

    const-string v15, "Couldn\'t find \'dpmd\' socket; retrying after timeout"

    # invokes: Lcom/qti/dpm/DpmService;->dlogi(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v14, v15}, Lcom/qti/dpm/DpmService;->access$1900(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_1

    goto :goto_7

    .line 727
    .end local v2    # "ex":Ljava/io/IOException;
    :catch_1
    move-exception v13

    .line 728
    .local v13, "tr":Ljava/lang/Throwable;
    :goto_9
    const-string v14, "REQ:RCVR"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Uncaught exception "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    # invokes: Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v14, v15}, Lcom/qti/dpm/DpmService;->access$1500(Ljava/lang/String;Ljava/lang/String;)V

    .line 730
    return-void

    .line 663
    .end local v13    # "tr":Ljava/lang/Throwable;
    .restart local v2    # "ex":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 664
    .local v1, "er":Ljava/lang/InterruptedException;
    :try_start_c
    const-string v14, "REQ:RCVR"

    const-string v15, "dpmd socket open retry timer was interrupted"

    # invokes: Lcom/qti/dpm/DpmService;->dlogi(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v14, v15}, Lcom/qti/dpm/DpmService;->access$1900(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_1

    goto :goto_8

    .line 690
    .end local v1    # "er":Ljava/lang/InterruptedException;
    .end local v2    # "ex":Ljava/io/IOException;
    .end local v10    # "s":Landroid/net/LocalSocket;
    .restart local v4    # "is":Ljava/io/InputStream;
    .restart local v5    # "l":Landroid/net/LocalSocketAddress;
    .restart local v6    # "length":I
    .restart local v11    # "s":Landroid/net/LocalSocket;
    :cond_3
    :try_start_d
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v7

    .line 691
    .local v7, "p":Landroid/os/Parcel;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->buffer:[B

    const/4 v15, 0x0

    invoke-virtual {v7, v14, v15, v6}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 692
    const/4 v14, 0x0

    invoke-virtual {v7, v14}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 694
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    # invokes: Lcom/qti/dpm/DpmService;->processResponse(Landroid/os/Parcel;)V
    invoke-static {v14, v7}, Lcom/qti/dpm/DpmService;->access$2300(Lcom/qti/dpm/DpmService;Landroid/os/Parcel;)V

    .line 695
    invoke-virtual {v7}, Landroid/os/Parcel;->recycle()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_5

    goto/16 :goto_1

    .line 697
    .end local v4    # "is":Ljava/io/InputStream;
    .end local v7    # "p":Landroid/os/Parcel;
    :catch_3
    move-exception v2

    .line 698
    .restart local v2    # "ex":Ljava/io/IOException;
    :try_start_e
    const-string v14, "REQ:RCVR"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "\'dpmd\' socket closed"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    # invokes: Lcom/qti/dpm/DpmService;->rlog(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v14, v15}, Lcom/qti/dpm/DpmService;->access$1800(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 727
    .end local v2    # "ex":Ljava/io/IOException;
    .end local v5    # "l":Landroid/net/LocalSocketAddress;
    .end local v6    # "length":I
    :catch_4
    move-exception v13

    move-object v10, v11

    .end local v11    # "s":Landroid/net/LocalSocket;
    .restart local v10    # "s":Landroid/net/LocalSocket;
    goto :goto_9

    .line 699
    .end local v10    # "s":Landroid/net/LocalSocket;
    .restart local v5    # "l":Landroid/net/LocalSocketAddress;
    .restart local v6    # "length":I
    .restart local v11    # "s":Landroid/net/LocalSocket;
    :catch_5
    move-exception v13

    .line 700
    .restart local v13    # "tr":Ljava/lang/Throwable;
    const-string v14, "REQ:RCVR"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Uncaught exception read length="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "Exception:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v13}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    # invokes: Lcom/qti/dpm/DpmService;->logw(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v14, v15}, Lcom/qti/dpm/DpmService;->access$1500(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_4

    goto/16 :goto_2

    .line 724
    .end local v13    # "tr":Ljava/lang/Throwable;
    .restart local v3    # "i":I
    .restart local v12    # "sz":I
    :cond_4
    :try_start_f
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/qti/dpm/DpmService$DpmReceiver;->this$0:Lcom/qti/dpm/DpmService;

    iget-object v14, v14, Lcom/qti/dpm/DpmService;->mRequestsList:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->clear()V

    .line 725
    monitor-exit v15

    goto/16 :goto_0

    .end local v12    # "sz":I
    :catchall_0
    move-exception v14

    monitor-exit v15
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    :try_start_10
    throw v14
    :try_end_10
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_10} :catch_4

    .line 647
    .end local v3    # "i":I
    .end local v5    # "l":Landroid/net/LocalSocketAddress;
    .end local v6    # "length":I
    .end local v11    # "s":Landroid/net/LocalSocket;
    .restart local v2    # "ex":Ljava/io/IOException;
    .restart local v10    # "s":Landroid/net/LocalSocket;
    :catch_6
    move-exception v14

    goto/16 :goto_6

    .line 710
    .end local v2    # "ex":Ljava/io/IOException;
    .end local v10    # "s":Landroid/net/LocalSocket;
    .restart local v5    # "l":Landroid/net/LocalSocketAddress;
    .restart local v6    # "length":I
    .restart local v11    # "s":Landroid/net/LocalSocket;
    :catch_7
    move-exception v14

    goto/16 :goto_3

    .line 642
    .end local v5    # "l":Landroid/net/LocalSocketAddress;
    .end local v6    # "length":I
    :catch_8
    move-exception v2

    move-object v10, v11

    .end local v11    # "s":Landroid/net/LocalSocket;
    .restart local v10    # "s":Landroid/net/LocalSocket;
    goto/16 :goto_5
.end method
