Imports Microsoft.VisualBasic
Imports System.Collections.Generic

Public Class StoredShoppingCart

    Public Shared Function Read() As ShoppingCart

        Return FetchCart()

    End Function

    Public Shared Function Update(ByVal DeliveryCharge As Decimal) As Integer

        Dim cart As ShoppingCart = FetchCart()

        cart.DeliveryCharge = DeliveryCharge

    End Function


    Public Shared Function ReadItems() As List(Of CartItem)

        Dim cart As ShoppingCart = FetchCart()

        Return cart.Items

    End Function

    Public Shared Function UpdateItem(ByVal MenuItemID As Integer, ByVal ItemSize As String, ByVal Quantity As Integer) As Integer

        Dim cart As ShoppingCart = FetchCart()

        cart.Update(MenuItemID, ItemSize, Quantity)

    End Function

    Public Shared Function DeleteItem(ByVal MenuItemID As Integer, ByVal ItemSize As String) As Integer

        Dim cart As ShoppingCart = FetchCart()

        cart.Delete(MenuItemID, ItemSize)

    End Function

    Public Shared Function InsertItem(ByVal MenuItemID As Integer, ByVal ItemName As String, ByVal ItemSize As String, ByVal Quantity As Integer, ByVal ItemPrice As Decimal) As Integer

        Dim cart As ShoppingCart = FetchCart()

        cart.Insert(MenuItemID, ItemSize, ItemName, ItemPrice, Quantity)

    End Function

    Private Shared Function FetchCart() As ShoppingCart

        ' Fetch the cart from the session
        Dim cart As ShoppingCart = DirectCast(HttpContext.Current.Session("Cart"), ShoppingCart)

        ' If it isn't in the session, then create a new cart
        ' and place it in the session
        If cart Is Nothing Then
            cart = New ShoppingCart()
            HttpContext.Current.Session("Cart") = cart
        End If

        Return cart

    End Function

End Class
