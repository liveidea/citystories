var ready, storyAddress, storyTitle;

ready = function() {
  ymaps.ready(init);
        var myMap, 
            myPlacemark;
            

        function init(){ 
          ymaps.geocode(storyAddress, { results: 1 }).then(function (res) {
        // Выбираем первый результат геокодирования.
        var firstGeoObject = res.geoObjects.get(0),
        // Создаем карту с нужным центром.
            myMap = new ymaps.Map("YMapsID", {
                center: firstGeoObject.geometry.getCoordinates(),
                zoom: 16,
                behaviors: ["scrollZoom"]
            });
            var SearchControl = new ymaps.control.SearchControl({noPlacemark:true});  
 
      //Добавляем элементы управления на карту
       myMap.controls
        .add(SearchControl)                
                .add('zoomControl')                
                .add('typeSelector')                 
                .add('mapTools');
            myPlacemark = new ymaps.Placemark(firstGeoObject.geometry.getCoordinates(), { 
            hintContent: storyTitle
             
        });

        myMap.geoObjects.add(myPlacemark);
            });
        }
  };
$(document).ready(ready)
$(document).on('page:load', ready)