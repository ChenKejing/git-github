Imports Microsoft.VisualBasic
Imports System.Collections.Generic

Public Class CartItem

    Private _menuItemID As Integer
    Private _itemName As String
    Private _itemSize As String
    Private _quantity As Integer
    Private _itemPrice As Decimal
    Private _lineValue As Decimal

    Public Sub New()


    End Sub

    Public Sub New(ByVal MenuItemID As Integer, ByVal ItemName As String, _
    ByVal ItemSize As String, ByVal Quantity As Integer, _
    ByVal ItemPrice As Decimal, ByVal LineValue As Decimal)
        _menuItemID = MenuItemID
        _itemName = ItemName
        _itemSize = ItemSize
        _quantity = Quantity
        _itemPrice = ItemPrice
        _lineValue = LineValue
    End Sub

    Public Property MenuItemID() As Integer
        Get
            Return _menuItemID
        End Get
        Set(ByVal value As Integer)
            _menuItemID = value
        End Set
    End Property
    Public Property ItemName() As String
        Get
            Return _itemName
        End Get
        Set(ByVal value As String)
            _itemName = value
        End Set
    End Property

    Public Property ItemSize() As String
        Get
            Return _itemSize
        End Get
        Set(ByVal value As String)
            _itemSize = value
        End Set
    End Property

    Public Property Quantity() As String
        Get
            Return _quantity
        End Get
        Set(ByVal value As String)
            _quantity = value
        End Set
    End Property

    Public Property ItemPrice() As String
        Get
            Return _itemPrice
        End Get
        Set(ByVal value As String)
            _itemPrice = value
        End Set
    End Property

    Public Property LineValue() As String
        Get
            Return _itemPrice
        End Get
        Set(ByVal value As String)
            _itemPrice = value
        End Set
    End Property

End Class

Public Class ShoppingCart

    Private _salesTaxPercent As Decimal
    Private _items As List(Of CartItem)
    Private _deliveryCharge As Decimal 

    Public Sub New()
        If _items Is Nothing Then
            _items = New List(Of CartItem)
        End If
        _salesTaxPercent = _
        Convert.ToDecimal(ConfigurationManager.AppSettings("SalesTax"))
    End Sub
    Public ReadOnly Property Items() As List(Of CartItem)
        Get
            Return _items
        End Get
    End Property
    Public ReadOnly Property SubTotal() As Decimal
        Get
            Dim tot As Decimal
            For Each item As CartItem In _items
                tot += item.ItemPrice
                '+ LineValue()
            Next
            Return tot
        End Get
    End Property

    Public ReadOnly Property SalesTaxPercent() As Decimal
        Get
            Return _salesTaxPercent
        End Get
    End Property

    Public ReadOnly Property SalesTax() As Decimal
        Get
            'Return (SubTotal + DeliveryCharge) * SalesTaxPercent
            Return (SubTotal) * SalesTaxPercent
        End Get
    End Property

    Public ReadOnly Property Total() As Decimal
        Get
            'Return SubTotal + DeliveryCharge + SalesTax
            Return SubTotal + SalesTax
        End Get
    End Property

    Public Property DeliveryCharge() As Decimal
        Get
            Return _deliveryCharge
        End Get
        Set(ByVal value As Decimal)
            _deliveryCharge = value
        End Set
    End Property

    Public Sub Insert(ByVal MenuItemID As Integer, ByVal ItemSize As String, _
    ByVal itemName As String, ByVal ItemPrice As Decimal, _
    ByVal Quantity As Integer)
        Dim idx As Integer = ItemIndex(MenuItemID, ItemSize)
        If idx = -1 Then
            ' create a new cart item
            Dim NewItem As New CartItem()
            NewItem.MenuItemID = MenuItemID
            NewItem.ItemSize = ItemSize
            NewItem.ItemName = itemName
            NewItem.Quantity = Quantity
            NewItem.ItemPrice = ItemPrice
            _items.Add(NewItem)
        Else
            _items(idx).Quantity += 1
        End If
    End Sub
    Public Sub Update(ByVal MenuItemID As Integer, ByVal ItemSize As String, _
    ByVal Quantity As Integer)
        Dim idx As Integer = ItemIndex(MenuItemID, ItemSize)
        If idx <> -1 Then
            _items(idx).Quantity = Quantity
        End If
    End Sub

    Public Sub Delete(ByVal MenuItemID As Integer, ByVal ItemSize As String)
        Dim idx As Integer = ItemIndex(MenuItemID, ItemSize)
        If idx <> -1 Then
            _items.RemoveAt(idx)
        End If
    End Sub

    Private Function ItemIndex(ByVal MenuItemID As Integer, _
    ByVal ItemSize As String) As Integer
        Dim index As Integer
        For Each item As CartItem In _items
            If item.MenuItemID = MenuItemID AndAlso item.ItemSize = ItemSize Then
                Return index
            End If
            index += 1
        Next
        Return -1
    End Function

End Class
