.class public Lcom/example/myapplication/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method public static byteArrayToHex([B)Ljava/lang/String;
    .registers 9
    .param p0, "a"    # [B

    .prologue
    const/4 v3, 0x0

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    array-length v2, p0

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 40
    .local v1, "sb":Ljava/lang/StringBuilder;
    array-length v4, p0

    move v2, v3

    :goto_b
    if-ge v2, v4, :cond_24

    aget-byte v0, p0, v2

    .line 41
    .local v0, "b":B
    const-string v5, "%02x"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 42
    .end local v0    # "b":B
    :cond_24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static copyFile(Ljava/io/File;Ljava/io/File;)V
    .registers 8
    .param p0, "sourceFile"    # Ljava/io/File;
    .param p1, "destFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_11

    .line 169
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 171
    :cond_11
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1a

    .line 172
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    .line 175
    :cond_1a
    const/4 v1, 0x0

    .line 176
    .local v1, "source":Ljava/nio/channels/FileChannel;
    const/4 v0, 0x0

    .line 179
    .local v0, "destination":Ljava/nio/channels/FileChannel;
    :try_start_1c
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 180
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 181
    const-wide/16 v2, 0x0

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J
    :try_end_37
    .catchall {:try_start_1c .. :try_end_37} :catchall_42

    .line 183
    if-eqz v1, :cond_3c

    .line 184
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V

    .line 186
    :cond_3c
    if-eqz v0, :cond_41

    .line 187
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 190
    :cond_41
    return-void

    .line 183
    :catchall_42
    move-exception v2

    if-eqz v1, :cond_48

    .line 184
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V

    .line 186
    :cond_48
    if-eqz v0, :cond_4d

    .line 187
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 189
    :cond_4d
    throw v2
.end method

.method public static copyFileOrDirectory(Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p0, "srcDir"    # Ljava/lang/String;
    .param p1, "dstDir"    # Ljava/lang/String;

    .prologue
    .line 146
    :try_start_0
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 147
    .local v6, "src":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, p1, v8}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .local v0, "dst":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_31

    .line 151
    invoke-virtual {v6}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v3

    .line 152
    .local v3, "files":[Ljava/lang/String;
    array-length v4, v3

    .line 153
    .local v4, "filesLength":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1a
    if-ge v5, v4, :cond_34

    .line 154
    new-instance v8, Ljava/io/File;

    aget-object v9, v3, v5

    invoke-direct {v8, v6, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    .line 155
    .local v7, "src1":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "dst1":Ljava/lang/String;
    invoke-static {v7, v1}, Lcom/example/myapplication/MainActivity;->copyFileOrDirectory(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    add-int/lit8 v5, v5, 0x1

    goto :goto_1a

    .line 160
    .end local v1    # "dst1":Ljava/lang/String;
    .end local v3    # "files":[Ljava/lang/String;
    .end local v4    # "filesLength":I
    .end local v5    # "i":I
    .end local v7    # "src1":Ljava/lang/String;
    :cond_31
    invoke-static {v6, v0}, Lcom/example/myapplication/MainActivity;->copyFile(Ljava/io/File;Ljava/io/File;)V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_34} :catch_35

    .line 165
    .end local v0    # "dst":Ljava/io/File;
    .end local v6    # "src":Ljava/io/File;
    :cond_34
    :goto_34
    return-void

    .line 162
    :catch_35
    move-exception v2

    .line 163
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_34
.end method

.method public static decode(Ljava/lang/String;ILjava/lang/String;)V
    .registers 6
    .param p0, "paramString"    # Ljava/lang/String;
    .param p1, "paramInt"    # I
    .param p2, "decodeParam"    # Ljava/lang/String;

    .prologue
    .line 46
    const-string v0, "decode"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "paramString = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ; paramInt = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ; decodeParam = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-void
.end method

.method public static decodeBytes(Ljavax/crypto/SecretKey;[B[B)[B
    .registers 6
    .param p0, "key"    # Ljavax/crypto/SecretKey;
    .param p1, "input"    # [B
    .param p2, "out"    # [B

    .prologue
    .line 50
    const-string v0, "decodeBytes"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " input= "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/example/myapplication/MainActivity;->byteArrayToHex([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " output "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p2}, Lcom/example/myapplication/MainActivity;->byteArrayToHex([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    return-object p2
.end method

.method public static encodeBytes(Ljavax/crypto/SecretKey;[B[B)[B
    .registers 6
    .param p0, "key"    # Ljavax/crypto/SecretKey;
    .param p1, "input"    # [B
    .param p2, "out"    # [B

    .prologue
    .line 55
    const-string v0, "encodeBytes"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " input= "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/example/myapplication/MainActivity;->byteArrayToHex([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " output "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p2}, Lcom/example/myapplication/MainActivity;->byteArrayToHex([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    return-object p2
.end method

.method public static getFilePath(Ljava/lang/String;)Ljava/io/File;
    .registers 3
    .param p0, "fileName"    # Ljava/lang/String;

    .prologue
    .line 140
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lcom/example/myapplication/MainActivity;->getStorageDir(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getInputStream(Ljava/lang/String;)Ljava/io/FileInputStream;
    .registers 4
    .param p0, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 136
    new-instance v0, Ljava/io/FileInputStream;

    new-instance v1, Ljava/io/File;

    invoke-static {p0}, Lcom/example/myapplication/MainActivity;->getStorageDir(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public static getIp()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    const-string v0, "ip.txt"

    const-string v1, "192.168.8.46"

    invoke-static {v0, v1}, Lcom/example/myapplication/MainActivity;->readFromFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMacAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 60
    const-string v0, "mac.txt"

    const-string v1, "6C:C7:EC:2B:00:00"

    invoke-static {v0, v1}, Lcom/example/myapplication/MainActivity;->readFromFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getOutputStream(Ljava/lang/String;I)Ljava/io/FileOutputStream;
    .registers 5
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 130
    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v2, Ljava/io/File;

    .line 131
    invoke-static {p0}, Lcom/example/myapplication/MainActivity;->getStorageDir(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const v0, 0x8000

    if-ne p1, v0, :cond_15

    const/4 v0, 0x1

    :goto_11
    invoke-direct {v1, v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 130
    return-object v1

    .line 131
    :cond_15
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static getPort()I
    .registers 2

    .prologue
    .line 68
    const-string v0, "port.txt"

    const-string v1, "8080"

    invoke-static {v0, v1}, Lcom/example/myapplication/MainActivity;->readFromFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getPrivateKey()[B
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 203
    const/16 v1, 0x10

    new-array v0, v1, [B

    .line 204
    .local v0, "bytes":[B
    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    invoke-virtual {v1, v0}, Ljava/util/Random;->nextBytes([B)V

    .line 205
    const-string v1, "privateKey.txt"

    .line 206
    invoke-static {v0, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    .line 205
    invoke-static {v1, v2}, Lcom/example/myapplication/MainActivity;->readFromFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    return-object v1
.end method

.method public static getStorageDir(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "fileName"    # Ljava/lang/String;

    .prologue
    .line 95
    .line 96
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6f

    .line 97
    const-string v2, "/data/data/com.inventec.iMobile2.gsm/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 98
    const-string v2, "/data/data/com.inventec.iMobile2.gsm/"

    const-string v3, ""

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 100
    :cond_1e
    const-string v2, "/data/data/com.inventec.iMobile2/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 101
    const-string v2, "/data/data/com.inventec.iMobile2/"

    const-string v3, ""

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 104
    :cond_2e
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/phev"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 105
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_53

    .line 106
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 108
    :cond_53
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 125
    .end local v0    # "file":Ljava/io/File;
    :goto_6e
    return-object v1

    .line 112
    :cond_6f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/phev"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_b7

    .line 114
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/phev"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 114
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 118
    :cond_b7
    const-string v2, "/data/data/com.inventec.iMobile2.gsm/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_c7

    .line 119
    const-string v2, "/data/data/com.inventec.iMobile2.gsm/"

    const-string v3, "/phev"

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 121
    :cond_c7
    const-string v2, "/data/data/com.inventec.iMobile2/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_d7

    .line 122
    const-string v2, "/data/data/com.inventec.iMobile2/"

    const-string v3, "/phev"

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_d7
    move-object v1, p0

    .line 125
    goto :goto_6e
.end method

.method public static readFromFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 72
    invoke-static {p0}, Lcom/example/myapplication/MainActivity;->getStorageDir(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 73
    .local v4, "storageDir":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 74
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_27

    .line 76
    :try_start_10
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 77
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_18} :catch_43

    .local v1, "bw":Ljava/io/FileOutputStream;
    const/4 v5, 0x0

    .line 78
    :try_start_19
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_20} :catch_4e
    .catchall {:try_start_19 .. :try_end_20} :catchall_89

    .line 79
    if-eqz v1, :cond_27

    if-eqz v6, :cond_4a

    :try_start_24
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_24 .. :try_end_27} :catch_3e
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_27} :catch_43

    .line 85
    .end local v1    # "bw":Ljava/io/FileOutputStream;
    :cond_27
    :goto_27
    :try_start_27
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/FileReader;

    invoke-direct {v5, v3}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_31} :catch_6a

    .local v0, "br":Ljava/io/BufferedReader;
    const/4 v5, 0x0

    .line 86
    :try_start_32
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_35
    .catch Ljava/lang/Throwable; {:try_start_32 .. :try_end_35} :catch_75
    .catchall {:try_start_32 .. :try_end_35} :catchall_77

    move-result-object v7

    .line 87
    if-eqz v0, :cond_3d

    if-eqz v6, :cond_71

    :try_start_3a
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_3d
    .catch Ljava/lang/Throwable; {:try_start_3a .. :try_end_3d} :catch_65
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3d} :catch_6a

    .line 86
    :cond_3d
    :goto_3d
    return-object v7

    .line 79
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "bw":Ljava/io/FileOutputStream;
    :catch_3e
    move-exception v7

    :try_start_3f
    invoke-virtual {v5, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_42} :catch_43

    goto :goto_27

    .line 80
    .end local v1    # "bw":Ljava/io/FileOutputStream;
    :catch_43
    move-exception v2

    .line 81
    .local v2, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 79
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "bw":Ljava/io/FileOutputStream;
    :cond_4a
    :try_start_4a
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4d} :catch_43

    goto :goto_27

    .line 77
    :catch_4e
    move-exception v5

    :try_start_4f
    throw v5
    :try_end_50
    .catchall {:try_start_4f .. :try_end_50} :catchall_50

    .line 79
    :catchall_50
    move-exception v6

    move-object v8, v6

    move-object v6, v5

    move-object v5, v8

    :goto_54
    if-eqz v1, :cond_5b

    if-eqz v6, :cond_61

    :try_start_58
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5b
    .catch Ljava/lang/Throwable; {:try_start_58 .. :try_end_5b} :catch_5c
    .catch Ljava/io/IOException; {:try_start_58 .. :try_end_5b} :catch_43

    :cond_5b
    :goto_5b
    :try_start_5b
    throw v5

    :catch_5c
    move-exception v7

    invoke-virtual {v6, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_5b

    :cond_61
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_64} :catch_43

    goto :goto_5b

    .line 87
    .end local v1    # "bw":Ljava/io/FileOutputStream;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :catch_65
    move-exception v6

    :try_start_66
    invoke-virtual {v5, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_69
    .catch Ljava/io/IOException; {:try_start_66 .. :try_end_69} :catch_6a

    goto :goto_3d

    .line 88
    .end local v0    # "br":Ljava/io/BufferedReader;
    :catch_6a
    move-exception v2

    .line 89
    .restart local v2    # "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 87
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :cond_71
    :try_start_71
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_74
    .catch Ljava/io/IOException; {:try_start_71 .. :try_end_74} :catch_6a

    goto :goto_3d

    .line 85
    :catch_75
    move-exception v6

    :try_start_76
    throw v6
    :try_end_77
    .catchall {:try_start_76 .. :try_end_77} :catchall_77

    .line 87
    :catchall_77
    move-exception v5

    if-eqz v0, :cond_7f

    if-eqz v6, :cond_85

    :try_start_7c
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_7f
    .catch Ljava/lang/Throwable; {:try_start_7c .. :try_end_7f} :catch_80
    .catch Ljava/io/IOException; {:try_start_7c .. :try_end_7f} :catch_6a

    :cond_7f
    :goto_7f
    :try_start_7f
    throw v5

    :catch_80
    move-exception v7

    invoke-virtual {v6, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_7f

    :cond_85
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_88
    .catch Ljava/io/IOException; {:try_start_7f .. :try_end_88} :catch_6a

    goto :goto_7f

    .line 79
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "bw":Ljava/io/FileOutputStream;
    :catchall_89
    move-exception v5

    goto :goto_54
.end method

.method public static saveFile2([B)V
    .registers 5
    .param p0, "data"    # [B

    .prologue
    .line 194
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/test.txt"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 195
    .local v1, "f":Ljava/io/FileOutputStream;
    invoke-virtual {v1, p0}, Ljava/io/FileOutputStream;->write([B)V

    .line 196
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_22} :catch_23

    .line 200
    .end local v1    # "f":Ljava/io/FileOutputStream;
    :goto_22
    return-void

    .line 197
    :catch_23
    move-exception v0

    .line 198
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_22
.end method


# virtual methods
.method public exportFiles()V
    .registers 8

    .prologue
    .line 211
    new-instance v1, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/phev/export"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 212
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-nez v3, :cond_25

    .line 213
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 215
    :cond_25
    invoke-virtual {p0}, Lcom/example/myapplication/MainActivity;->fileList()[Ljava/lang/String;

    move-result-object v2

    .line 216
    .local v2, "list":[Ljava/lang/String;
    array-length v4, v2

    const/4 v3, 0x0

    :goto_2b
    if-ge v3, v4, :cond_41

    aget-object v0, v2, v3

    .line 217
    .local v0, "f":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/example/myapplication/MainActivity;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/example/myapplication/MainActivity;->copyFileOrDirectory(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    add-int/lit8 v3, v3, 0x1

    goto :goto_2b

    .line 219
    .end local v0    # "f":Ljava/lang/String;
    :cond_41
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 223
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 224
    invoke-virtual {p0}, Lcom/example/myapplication/MainActivity;->exportFiles()V

    .line 225
    const v2, 0x7f0b001c

    invoke-virtual {p0, v2}, Lcom/example/myapplication/MainActivity;->setContentView(I)V

    .line 226
    const v2, 0x7f080168

    invoke-virtual {p0, v2}, Lcom/example/myapplication/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/Toolbar;

    .line 227
    .local v1, "toolbar":Landroidx/appcompat/widget/Toolbar;
    invoke-virtual {p0, v1}, Lcom/example/myapplication/MainActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 228
    const v2, 0x7f08009c

    invoke-virtual {p0, v2}, Lcom/example/myapplication/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 229
    .local v0, "fab":Lcom/google/android/material/floatingactionbutton/FloatingActionButton;
    new-instance v2, Lcom/example/myapplication/MainActivity$1;

    invoke-direct {v2, p0}, Lcom/example/myapplication/MainActivity$1;-><init>(Lcom/example/myapplication/MainActivity;)V

    invoke-virtual {v0, v2}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 236
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 241
    invoke-virtual {p0}, Lcom/example/myapplication/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f0c0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 242
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 250
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 253
    .local v0, "id":I
    const v1, 0x7f080044

    if-ne v0, v1, :cond_b

    .line 254
    const/4 v1, 0x1

    .line 257
    :goto_a
    return v1

    :cond_b
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_a
.end method
