/**
 * Detects if the browser is displaying the design in the tablet mode
 * @return {bool} Boolean true if in mobile mode false otherwise
 */
function isTabletMode() {
  if (typeof window.matchMedia !== "undefined") {
    var mq = window.matchMedia("only screen and (max-width: 1064px)");

    return mq.matches;
  } else {
    return window.innerWidth <= 1064;
  }
}

/**
 * Detects if the browser is displaying the design in the mobile mode
 * @return {bool} Boolean true if in mobile mode false otherwise
 */
function isMobileMode() {
  if (typeof window.matchMedia !== "undefined") {
    var mq = window.matchMedia("only screen and (max-width: 600px)");

    return mq.matches;
  } else {
    return window.innerWidth <= 600;
  }
}

(function ($) {
  var domReady = false;
  var resizeTimer = null;
  var wasMobile = false;
  var wasTablet = false;

  $(document).ready(function (e) {
    domReady = true;

    if (isMobileMode()) {
      wasMobile = true;
    }

    if (isTabletMode()) {
      //bind click event to mobile menu button
      $("#mobile-menu-trigger").click(showMobileMenu);

      //bind click event to menu close button
      $("#Header .menuwrapper .menu-close .close").click(hideMobileMenu);

      //bind click event to mobile menu open child button
      $("ul.menu-bar .open-child").click(toggleMobileMenuChildren);

      wasTablet = true;
    }

    let i = 0;
    $(".dot").each(function () {
      let hexPool = [
        "#000000",
        "#00814B",
        "#9622B2",
        "#707070",
        "#1299F3",
        "#F56200",
      ];
      // if i goes above the length of the hexPool, reset it
      if (i >= hexPool.length) i = 0;
      $(this).css("background-color", hexPool[i++]);
    });

    $(".open-button").on("click", function () {
      // show the fieldset
      $(document).find("fieldset").toggle();
    });
  });

  $(window).resize(function () {
    if (domReady == false) {
      return;
    }

    if (resizeTimer) {
      clearTimeout(resizeTimer);
    }

    resizeTimer = setTimeout(resizeDone, 200);
  });

  /**
   * Handles when the resize has stopped, many browsers fire as the resize is happening which is too much
   */
  function resizeDone() {
    //Clear the resize timer
    if (resizeTimer) {
      clearTimeout(resizeTimer);
    }

    if (wasMobile == false && isMobileMode()) {
      wasMobile = true;
    } else if (wasMobile && isMobileMode() == false) {
      wasMobile = false;
    }

    if (wasTablet == false && isTabletMode()) {
      //bind click event to mobile menu button
      $("#mobile-menu-trigger").click(showMobileMenu);

      //bind click event to menu close button
      $("#Header .menuwrapper .menu-close .close").click(hideMobileMenu);

      //bind click event to mobile menu open child button
      $("ul.menu-bar .open-child").click(toggleMobileMenuChildren);

      wasTablet = true;
    } else if (wasTablet && isTabletMode() == false) {
      //Remove the menu open style
      $("html").removeClass("menu-open");

      $(document.body).off("touchmove", blockTouchMove);

      //Remove the right style
      $("#Header .top-bar .menuwrapper")
        .css("right", "")
        .off("touchstart", iOSBounceStop)
        .off("touchmove", propagationStop);

      //Remove the display for sub menus
      $("#Header .top-bar .menuwrapper ul.menu-bar ul").css("display", "");

      //bind click event to mobile menu button
      $("#mobile-menu-trigger").off("click", showMobileMenu);

      //bind click event to menu close button
      $("#Header .menuwrapper .menu-close .close").off("click", hideMobileMenu);

      //bind click event to mobile menu open child button
      $("ul.menu-bar .open-child").off("click", toggleMobileMenuChildren);

      wasTablet = false;
    }

    $(window).trigger("sawlorresize");
  }

  /**
   * Shows the mobile menu
   * @param e Event Data
   */
  function showMobileMenu(e) {
    e.preventDefault();

    $("#Header .menuwrapper")
      .css("right", "0")
      .on("touchstart", iOSBounceStop)
      .on("touchmove", propagationStop);

    $("html").addClass("menu-open");
    $(document.body).on("touchmove", blockTouchMove);
  }

  /**
   * Hides the mobile menu
   */
  function hideMobileMenu() {
    $("html").removeClass("menu-open");

    $("#Header .menuwrapper")
      .css("right", "")
      .off("touchstart", iOSBounceStop)
      .off("touchmove", propagationStop);

    //Hide all sub-menus
    $("#Header .menuwrapper ul li .open-child i.fa-chevron-up").each(
      function () {
        var self = $(this);

        self.removeClass("fa-chevron-up").addClass("fa-chevron-down");
        self.closest("li").children(".column-wrap, ul").hide();
      }
    );

    $(document.body).off("touchmove", blockTouchMove);
  }

  /**
   * Block touch move
   */
  function blockTouchMove(e) {
    e.preventDefault();
  }

  /**
   * Stops the iOS bouncing scroll effect
   */
  function iOSBounceStop(e) {
    if (e.currentTarget.scrollTop === 0) {
      e.currentTarget.scrollTop = 1;
    } else if (
      e.currentTarget.scrollHeight ===
      e.currentTarget.scrollTop + e.currentTarget.offsetHeight
    ) {
      e.currentTarget.scrollTop -= 1;
    }
  }

  /**
   * Stops propagation of events
   */
  function propagationStop(e) {
    var target = $(e.currentTarget);
    if (target[0].scrollHeight > target.height()) {
      e.stopPropagation();
    }
  }

  /**
   * Toggle's children in the mobile menu
   * @param e Event Data
   */
  function toggleMobileMenuChildren(e) {
    e.preventDefault();

    var self = $(this);
    var icon = self.children("i");
    var subMenu = self.siblings("ul");

    icon.toggleClass("fa-chevron-down").toggleClass("fa-chevron-up");

    subMenu.slideToggle();

    //Hide all sub-menus
    if (icon.hasClass("fa-chevron-down")) {
      subMenu.find("li .open-child i.fa-chevron-up").each(function () {
        var self = $(this);

        self.removeClass("fa-chevron-up").addClass("fa-chevron-down");
        self.closest("li").children("ul").hide();
      });
    }
  }

  $("#increaseFontSize").click(function () {
    var fontSize = parseInt($("body").css("font-size"));
    if (fontSize >= 32);
    else {
      fontSize = fontSize + 4 + "px";
      $("body").css({ "font-size": fontSize });
      let original = parseInt(
        $("#currentFontSize").html().replace("Currently", "")
      );

      let current = original + 25;

      $("#currentFontSize").html("Currently " + current + "%");
    }
  });

  $("#decreaseFontSize").click(function () {
    var fontSize = parseInt($("body").css("font-size"));
    if (fontSize <= 16);
    else {
      fontSize = fontSize - 4 + "px";
      $("body").css({ "font-size": fontSize });
      let original = parseInt(
        $("#currentFontSize").html().replace("Currently", "")
      );

      let current = original - 25;

      $("#currentFontSize").html("Currently " + current + "%");
    }
  });
})(jQuery);
