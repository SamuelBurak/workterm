<%-- using flexbox for the container --%>
<div class="headerContainer alignItemsCenter">
    <div class="flexGrow">
        <img class="ml-8" src="https://via.placeholder.com/150x100.svg/000000?text=Company%20Logo" alt="company logo">
    </div>

    <div class="bLeft"></div>

    <%-- social media links --%>
    <div>
        <a href="#"><img src="$ThemeDir/images/linkedInBlack.svg" alt="linkedIn logo" width="38.35" height="37.872"></a>
        <a href="#"><img src="$ThemeDir/images/twitterBlack.svg" alt="twitter logo" width="38.35" height="37.872"></a>
        <a href="#"><img src="$ThemeDir/images/facebookBlack.svg" alt="facebook logo" width="38.35" height="37.872"></a>
    </div>

    <div class="bRight"></div>

    <%-- accessibility feature to increase text size --%>
    <div>
        <b class="mt-10 fs-1">Text size</b>
        <b id="increaseFontSize" class="clickable">+</b>
        <b id="decreaseFontSize" class="clickable">-</b>
        <p id="currentFontSize">Currently 100%</p>
    </div>

</div>
