.class Lcom/qti/dpm/DpmService$2;
.super Landroid/telephony/PhoneStateListener;
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
    .line 899
    iput-object p1, p0, Lcom/qti/dpm/DpmService$2;->this$0:Lcom/qti/dpm/DpmService;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataConnectionStateChanged(II)V
    .locals 3
    .param p1, "state"    # I
    .param p2, "networkType"    # I

    .prologue
    .line 902
    const-string v0, "SERVICE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDataConnectionStateChanged networkType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/qti/dpm/DpmService;->logi(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/qti/dpm/DpmService;->access$2400(Ljava/lang/String;Ljava/lang/String;)V

    .line 903
    iget-object v0, p0, Lcom/qti/dpm/DpmService$2;->this$0:Lcom/qti/dpm/DpmService;

    # setter for: Lcom/qti/dpm/DpmService;->mNetworkType:I
    invoke-static {v0, p2}, Lcom/qti/dpm/DpmService;->access$2502(Lcom/qti/dpm/DpmService;I)I

    .line 904
    return-void
.end method
