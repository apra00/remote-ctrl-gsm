.class Landroidx/appcompat/widget/SearchView$g;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/SearchView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:Landroidx/appcompat/widget/SearchView;


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/SearchView;)V
    .locals 0

    iput-object p1, p0, Landroidx/appcompat/widget/SearchView$g;->b:Landroidx/appcompat/widget/SearchView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 3

    iget-object v0, p0, Landroidx/appcompat/widget/SearchView$g;->b:Landroidx/appcompat/widget/SearchView;

    iget-object v1, v0, Landroidx/appcompat/widget/SearchView;->g0:Landroid/app/SearchableInfo;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return v2

    :cond_0
    iget-object v0, v0, Landroidx/appcompat/widget/SearchView;->q:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/appcompat/widget/SearchView$g;->b:Landroidx/appcompat/widget/SearchView;

    iget-object v0, v0, Landroidx/appcompat/widget/SearchView;->q:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getListSelection()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Landroidx/appcompat/widget/SearchView$g;->b:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/appcompat/widget/SearchView;->a(Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_1
    iget-object v0, p0, Landroidx/appcompat/widget/SearchView$g;->b:Landroidx/appcompat/widget/SearchView;

    iget-object v0, v0, Landroidx/appcompat/widget/SearchView;->q:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->a()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p3}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p3

    const/4 v0, 0x1

    if-ne p3, v0, :cond_4

    const/16 p3, 0x42

    if-ne p2, p3, :cond_4

    invoke-virtual {p1}, Landroid/view/View;->cancelLongPress()V

    const-string p1, "0"

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_2

    const/16 p1, 0xb

    move-object p3, p2

    goto :goto_0

    :cond_2
    iget-object p1, p0, Landroidx/appcompat/widget/SearchView$g;->b:Landroidx/appcompat/widget/SearchView;

    const/16 p3, 0xc

    move-object p3, p1

    const/16 p1, 0xc

    :goto_0
    if-eqz p1, :cond_3

    iget-object p1, p0, Landroidx/appcompat/widget/SearchView$g;->b:Landroidx/appcompat/widget/SearchView;

    goto :goto_1

    :cond_3
    move-object p1, p2

    const/4 v2, 0x1

    :goto_1
    iget-object p1, p1, Landroidx/appcompat/widget/SearchView;->q:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, v2, p2, p1}, Landroidx/appcompat/widget/SearchView;->a(ILjava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_4
    return v2
.end method
