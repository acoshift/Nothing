.pragma library

// const
var itemText =
        [
            "Apple", "Orange", "Grapes", "Cherries", "Carrot", "Sausages", "Mushroom",
            "Cheese", "Bread", "Milk", "Chocolate Bar", "Delicatessen", "Water Bottle",
            "Herb", "Medicine"
        ]

var keyText =
        [
            "Note", "Lab's Key", "Coin's researcher"
        ]

var game
var btnUp, btnDown, btnLeft, btnRight
var currentMap, currentChar
var wrapToX, wrapToY
var dialog, itemDialog, bag
var inventory, currentKey
var fullness, infection
var map04_item11
var settings
var mapState
var screenReset
var knowCode

reset()

function reset() {
    btnUp = false
    btnDown = false
    btnLeft = false
    btnRight = false
    currentMap = null
    currentChar = null
    wrapToX = 17; wrapToY = 5
    dialog = null
    itemDialog = null
    bag = null
    inventory = new Array()
    currentKey = 0
    fullness = 100; infection = 100
    map04_item11 = true
    knowCode = false
    mapState = "map07"
}

function isInventoryFull() {
    return inventory.length >= 5
}

function random(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

function randomInArray(arr) {
    return arr[random(0, arr.length - 1)]
}

function itemSource(iden) {
    if (iden <= 0) return ""
    if (iden < 10) return "qrc:/resources/item0" + iden + ".png"
    else return "qrc:/resources/item" + iden + ".png"
}

function keySource(iden) {
    if (iden <= 0) return ""
    else return "qrc:/resources/key0" + iden + ".png"
}

function gameEnd() {
    game.send("game", "end")
}

function gameOver() {
    game.send("game", "title")
}

function useItem(index) {
    var it = inventory[index]
    if (!it) return
    inventory.splice(index, 1)
    __useItemEffect(it)
    if (fullness >= 100) fullness = 100
    if (infection >= 100) infection = 100
}

function __useItemEffect(it) {
    switch (it) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
            fullness += 5
            break
        case 8:
        case 10:
        case 11:
            fullness += 10
            break
        case 9:
        case 12:
            fullness += 15
            break
        case 13:
            fullness += 0
            break
        case 14:
            infection += -5
            break
        case 15:
            infection += 10
            break
    }
}

function save() {
    settings.saved = true
    settings.mapState = mapState
    settings.wrapToX = currentChar.blockX
    settings.wrapToY = currentChar.blockY
    settings.inventory = inventory
    settings.currentKey = currentKey
    settings.fullness = fullness
    settings.infection = infection
    settings.map04_item11 = map04_item11
    settings.knowCode = knowCode
}

function load() {
    mapState = settings.mapState
    wrapToX = settings.wrapToX
    wrapToY = settings.wrapToY
    inventory = settings.inventory
    currentKey = settings.currentKey
    fullness = settings.fullness
    infection = settings.infection
    map04_item11 = settings.map04_item11
    knowCode = settings.knowCode
    screenReset()
}
