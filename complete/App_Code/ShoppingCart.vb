Imports Microsoft.VisualBasic
Imports System.Collections.Generic

Public Class CartItem

    Private _menuItemID As Integer
    Private _itemName As String
    Private _itemSize As String
    Private _quantity As Integer
    Private _itemPrice As Decimal

    Public Sub New()
    End Sub

    Public Sub New(ByVal MenuItemID As Integer, ByVal ItemName As String, ByVal ItemSize As String, ByVal Quantity As Integer, ByVal ItemPrice As Decimal)

        _menuItemID = MenuItemID
        _itemName = ItemName
        _itemSize = ItemSize
        _quantity = Quantity
        _itemPrice = ItemPrice

    End Sub


    ''' <summary>
    ''' The ID of the menu item
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property MenuItemID() As Integer
        Get
            Return _menuItemID
        End Get
        Set(ByVal value As Integer)
            _menuItemID = value
        End Set
    End Property

    ''' <summary>
    ''' The name of the menu item
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property ItemName() As String
        Get
            Return _itemName
        End Get
        Set(ByVal value As String)
            _itemName = value
        End Set
    End Property

    ''' <summary>
    ''' The size of the menu item
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property ItemSize() As String
        Get
            Return _itemSize
        End Get
        Set(ByVal value As String)
            _itemSize = value
        End Set
    End Property

    ''' <summary>
    ''' The quantity required
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property Quantity() As Integer
        Get
            Return _quantity
        End Get
        Set(ByVal value As Integer)
            _quantity = value
        End Set
    End Property

    ''' <summary>
    ''' The price of the menu item
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property ItemPrice() As Decimal
        Get
            Return _itemPrice
        End Get
        Set(ByVal value As Decimal)
            _itemPrice = value
        End Set
    End Property

    ''' <summary>
    ''' The value of the items
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public ReadOnly Property LineValue() As Decimal
        Get
            Return _quantity * _itemPrice
        End Get
    End Property

End Class

Public Class ShoppingCart

    Private _salesTaxPercent As Decimal
    Private _items As List(Of CartItem)

    Public Sub New()

        If _items Is Nothing Then
            _items = New List(Of CartItem)
        End If

        _salesTaxPercent = Convert.ToDecimal(ConfigurationManager.AppSettings("SalesTax"))

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
                tot += item.LineValue
            Next
            Return tot
        End Get
    End Property

    Private _deliveryCharge = 3.5
    Public Property DeliveryCharge() As Decimal
        Get
            Return _deliveryCharge
        End Get
        Set(ByVal value As Decimal)
            _deliveryCharge = value
        End Set
    End Property

    ''' <summary>
    ''' The percentage of sales tax
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks>Fetched from the web.config application configuration section. Read only.</remarks>
    Public ReadOnly Property SalesTaxPercent() As Decimal
        Get
            Return _salesTaxPercent
        End Get
    End Property

    ''' <summary>
    ''' The value of the sales tax to be added to the order
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks>Read only</remarks>
    Public ReadOnly Property SalesTax() As Decimal
        Get
            Return (SubTotal + DeliveryCharge) * SalesTaxPercent
        End Get
    End Property

    ''' <summary>
    ''' The total value of the order
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks>Read only</remarks>
    Public ReadOnly Property Total() As Decimal
        Get
            Return SubTotal + DeliveryCharge + SalesTax
        End Get
    End Property



    ''' <summary>
    ''' Insert a new item into the cart
    ''' </summary>
    ''' <param name="MenuItemID"></param>
    ''' <param name="ItemSize"></param>
    ''' <param name="itemName"></param>
    ''' <param name="ItemPrice"></param>
    ''' <param name="Quantity"></param>
    ''' <remarks></remarks>
    Public Sub Insert(ByVal MenuItemID As Integer, ByVal ItemSize As String, ByVal itemName As String, ByVal ItemPrice As Decimal, ByVal Quantity As Integer)

        ' check to see if the item already exists in the cart
        Dim idx As Integer = ItemIndex(MenuItemID, ItemSize)

        ' -1 means the item wasn't in the cart already, so add it
        If idx = -1 Then
            ' create a new cart item
            Dim NewItem As New CartItem()

            ' set the properties of the new cart item to those passed into the Insert method
            NewItem.MenuItemID = MenuItemID
            NewItem.ItemSize = ItemSize
            NewItem.ItemName = itemName
            NewItem.Quantity = Quantity
            NewItem.ItemPrice = ItemPrice

            ' add the new item to the collection
            _items.Add(NewItem)
        Else
            ' the item already exists, so just increment the quantity
            _items(idx).Quantity += 1
        End If

    End Sub

    ''' <summary>
    ''' Update the quantity for an existing item in the cart
    ''' </summary>
    ''' <param name="MenuItemID"></param>
    ''' <param name="ItemSize"></param>
    ''' <param name="Quantity"></param>
    ''' <remarks></remarks>
    Public Sub Update(ByVal MenuItemID As Integer, ByVal ItemSize As String, ByVal Quantity As Integer)

        ' TODO: reader exercise
        ' If the quantity is 0 the item could be removed from the cart
        ' you could put an 'If' statement in to check for the quantity
        ' - if it is less than or equal to 0 then cal the Delete method
        ' - if it is greater than 0 then use the code below


        ' find the index number of the item
        Dim idx As Integer = ItemIndex(MenuItemID, ItemSize)

        ' if the item exists (that is, if the index value isn't -1), then update it
        If idx <> -1 Then
            _items(idx).Quantity = Quantity
        End If

    End Sub

    ''' <summary>
    ''' Delete an item from the collection
    ''' </summary>
    ''' <param name="MenuItemID"></param>
    ''' <param name="ItemSize"></param>
    ''' <remarks></remarks>
    Public Sub Delete(ByVal MenuItemID As Integer, ByVal ItemSize As String)

        ' find the index number of the item
        Dim idx As Integer = ItemIndex(MenuItemID, ItemSize)

        ' if the item exists (that is, if the index value isn't -1), then remove it
        If idx <> -1 Then
            _items.RemoveAt(idx)
        End If

    End Sub

    ''' <summary>
    ''' Fetch the index number of an item in the cart
    ''' </summary>
    ''' <param name="MenuItemID"></param>
    ''' <param name="ItemSize"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function ItemIndex(ByVal MenuItemID As Integer, ByVal ItemSize As String) As Integer

        Dim index As Integer

        ' loop through the items search for a match
        For Each item As CartItem In _items
            ' if the ID and the Size match, then the item has been found
            If item.MenuItemID = MenuItemID AndAlso item.ItemSize = ItemSize Then
                Return index
            End If
            index += 1
        Next

        ' -1 indicates no match, so the item didn't exist in the collection
        Return -1

    End Function

End Class