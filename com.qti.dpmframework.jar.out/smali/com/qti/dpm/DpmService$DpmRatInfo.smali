.class Lcom/qti/dpm/DpmService$DpmRatInfo;
.super Ljava/lang/Object;
.source "DpmService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/qti/dpm/DpmService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DpmRatInfo"
.end annotation


# instance fields
.field ifNameV4:Ljava/lang/String;

.field ifNameV6:Ljava/lang/String;

.field ipAddrV4:Ljava/lang/String;

.field ipAddrV6:Ljava/lang/String;

.field networkState:I

.field networkType:I

.field subType:I

.field final synthetic this$0:Lcom/qti/dpm/DpmService;


# direct methods
.method public constructor <init>(Lcom/qti/dpm/DpmService;)V
    .locals 2

    .prologue
    const/4 v1, -0x1

    const/4 v0, 0x0

    .line 178
    iput-object p1, p0, Lcom/qti/dpm/DpmService$DpmRatInfo;->this$0:Lcom/qti/dpm/DpmService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    iput-object v0, p0, Lcom/qti/dpm/DpmService$DpmRatInfo;->ipAddrV4:Ljava/lang/String;

    .line 180
    iput-object v0, p0, Lcom/qti/dpm/DpmService$DpmRatInfo;->ipAddrV6:Ljava/lang/String;

    .line 181
    iput-object v0, p0, Lcom/qti/dpm/DpmService$DpmRatInfo;->ifNameV4:Ljava/lang/String;

    .line 182
    iput-object v0, p0, Lcom/qti/dpm/DpmService$DpmRatInfo;->ifNameV6:Ljava/lang/String;

    .line 183
    iput v1, p0, Lcom/qti/dpm/DpmService$DpmRatInfo;->networkType:I

    .line 184
    sget-object v0, Landroid/net/NetworkInfo$State;->UNKNOWN:Landroid/net/NetworkInfo$State;

    # invokes: Lcom/qti/dpm/DpmService;->NetworkStateToInt(Landroid/net/NetworkInfo$State;)I
    invoke-static {p1, v0}, Lcom/qti/dpm/DpmService;->access$000(Lcom/qti/dpm/DpmService;Landroid/net/NetworkInfo$State;)I

    move-result v0

    iput v0, p0, Lcom/qti/dpm/DpmService$DpmRatInfo;->networkState:I

    .line 185
    iput v1, p0, Lcom/qti/dpm/DpmService$DpmRatInfo;->subType:I

    .line 186
    return-void
.end method
