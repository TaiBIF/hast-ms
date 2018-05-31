$(document).ready(function () {
    measureFrame();
});

/*
function CropImageToSquare(squareSize) {
    $('img.crop').each(function (i, item) {
        $(item).wrap('<div class="container" />');
    });

    $('div.container').each(function (i, item) {
        $(item).css({ 'height': squareSize + 'px', 'width': squareSize + 'px' });
    });

    $('.container img').each(function (i, item) {
        executeToSquare(item, squareSize);
    });
    });
}
  */
/*
function EnlargeImage(percent) {
    
    $('img.crop').each(function (i, item) {
       $(item).css({ 'height': percent + '%', 'width': percent + '%' });

    });
   
    $(this).css({ 'height': percent + '%', 'width': percent + '%' });
  
   
}
*/

function em(input) {
    var emSize = parseFloat($("body").css("font-size"));
    return (emSize * input)
}


function MoveImage() {
    /*
                    $('img.crop').each(function (i, item) {
                        $(item).animate({ left: "-=10%" }, 2000);               
                                         
                    });
                    */

    /*$(this).animate({ left: "-=10%" }, 2000);*/

}

function measureFrame() {
    $('img.crop').each(function (i, item) {

        var width = $(item).width();
        var height = $(item).height();


        if (width == height) {

        }
        else if (width > height) {

            $(item).css({ 'height': (width / height) * 100 + '%', 'width': (width / height) * 100 + '%' });

            $(item).animate({ left: "-=" + ((width / height) * 100 - 100) / 2 + "%" }, 0);

            $(item).parent().next().css({ 'position': 'relative' });
        }

        else if (width < height) {

            var footerLineHeight = $(item).parent().next().height()
            var footerHeight = footerLineHeight + em(1.6);
            var base = $(item).parent().parent().width() + footerHeight

            var move1 = (height - base) / height



            //$(item).animate({ top: "-=" + (((height - base)/height)*height) + "px" }, 2000);
            //$(item).animate({ bottom: "+=" + footerHeight + 'px' }, 4000);
            //$(item).parent().parent().css({ height: "-=" + ((height - footerHeight - width) / (height - footerHeight) * 100) + '%' });
            //$(item).parent().parent().css({ height: "-=" + footerHeight + 'px' });

            //var sHeight = em(2.75) + width + footerHeight

            //$(item).parent().parent().css({ height: "+=" + 200 + "px" });

            //$(item).parent().parent().css({ height: "-=" + (((height - base) / height) * height) + "px" });
            //$(item).parent().parent().animate({ bottom: "-=" + footerHeight + 'px' });
            //$(item).parent().parent().css({ height: $(item).parent().parent().width() + footerHeight });
            //

        }

    });
}



/*

 function executeToSquare(imageItem, squareSize)
 {
     var width = $(imageItem).width();
     var height = $(imageItem).height();

     var tmp_width = 0;
     var tmp_height = 0;

     if(width == height)
     {
         tmp_width = squareSize;
         tmp_height = squareSize;

         position_top = parseInt(0 - ((tmp_height - squareSize) / 2), 10);
         position_left = parseInt(0 - ((tmp_width - squareSize) / 2), 10);
     }
     else if(width > height)
     {
         tmp_width = parseInt(((width/height)*squareSize),10);
         tmp_height = squareSize;

         position_top = parseInt(((tmp_height - squareSize) / 2), 10);
         position_left = parseInt(0 - ((tmp_width - squareSize) / 2), 10);
     }
     else if (width > height) {
         tmp_width = squareSize;
         tmp_height = parseInt(((height/width)*squareSize),10);

         position_top = parseInt(0 - ((tmp_height - squareSize) / 2), 10);
         position_left = parseInt(((tmp_width - squareSize) / 2), 10);
     }

     $(imageItem)
     .attr('width', tmp_width).attr('height', tmp_height)
     .css({ left: position_left, top: position_top });

 }

 */