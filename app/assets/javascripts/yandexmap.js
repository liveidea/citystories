var ready;

ready = function() {
var myMap, myPlacemark, coords, address;
 
  ymaps.ready(init);
 
        function init () {
 
    //Определяем начальные параметры карты
            myMap = new ymaps.Map('YMapsID', {
                    center: [49.8315,24.0122], 
                    zoom: 11,
                    behaviors: ["scrollZoom"]
                }); 
 
      //Определяем элемент управления поиск по карте  
      var SearchControl = new ymaps.control.SearchControl({noPlacemark:true});  
 
      //Добавляем элементы управления на карту
       myMap.controls
        .add(SearchControl)                
                .add('zoomControl')                
                .add('typeSelector')                 
                .add('mapTools');
 
      coords = [49.8315, 24.0122];
 
      //Определяем метку и добавляем ее на карту        
      myPlacemark = new ymaps.Placemark([49.8315, 24.0122],{}, {preset: "twirl#redIcon", draggable: true}); 
 
      myMap.geoObjects.add(myPlacemark);      
 
      //Отслеживаем событие перемещения метки
      myPlacemark.events.add("dragend", function (e) {      
      coords = this.geometry.getCoordinates();
      ymaps.geocode(coords).then(function (res) {
                var names = [];
                // Переберём все найденные результаты и
                // запишем имена найденный объектов в массив names.
                res.geoObjects.each(function (obj) {
                    names.push(obj.properties.get('name'));
                });
                address = names
              });
      savecoordinats();
      }, myPlacemark);
 
      //Отслеживаем событие щелчка по карте
      myMap.events.add('click', function (e) {        
            coords = e.get('coordPosition');
            ymaps.geocode(coords).then(function (res) {
                var names = [];
                // Переберём все найденные результаты и
                // запишем имена найденный объектов в массив names.
                res.geoObjects.each(function (obj) {
                    names.push(obj.properties.get('name'));
                });
                address = names
              });
      savecoordinats();
      }); 
 
  //Отслеживаем событие выбора результата поиска
  SearchControl.events.add("resultselect", function (e) {
    coords = SearchControl.getResultsArray()[0].geometry.getCoordinates();
    ymaps.geocode(coords).then(function (res) {
                var names = [];
                // Переберём все найденные результаты и
                // запишем имена найденный объектов в массив names.
                res.geoObjects.each(function (obj) {
                    names.push(obj.properties.get('name'));
                });
                address = names
              });
    savecoordinats();
  });
 
  //Ослеживаем событие изменения области просмотра карты - масштаб и центр карты
  myMap.events.add('boundschange', function (event) {
    if (event.get('newZoom') != event.get('oldZoom')) { 
        ymaps.geocode(coords).then(function (res) {
                var names = [];
                // Переберём все найденные результаты и
                // запишем имена найденный объектов в массив names.
                res.geoObjects.each(function (obj) {
                    names.push(obj.properties.get('name'));
                });
                address = names
              });  
        savecoordinats();
    }
    if (event.get('newCenter') != event.get('oldCenter')) {
        ymaps.geocode(coords).then(function (res) {
                var names = [];
                // Переберём все найденные результаты и
                // запишем имена найденный объектов в массив names.
                res.geoObjects.each(function (obj) {
                    names.push(obj.properties.get('name'));
                });
                address = names
              });   
        savecoordinats();
    }
 
  });
 
    }
 
  //Функция для передачи полученных значений в форму
  function savecoordinats (){ 
    var new_coords = [coords[0].toFixed(8), coords[1].toFixed(8)];  
    myPlacemark.getOverlay().getData().geometry.setCoordinates(new_coords);
    //document.getElementById("latlongmet").value = new_coords;
    document.getElementById("address").value = address;
    //var center = myMap.getCenter();
    //var new_center = [center[0].toFixed(4), center[1].toFixed(4)];  
    //document.getElementById("latlongcenter").value = new_center;  
  }
  
};
$(document).ready(ready)
$(document).on('page:load', ready)