<%-- grid container --%>
<footer class="footerGrid">

    <%-- footer navigation --%>
    <div>
        <nav aria-label='secondary'>
            <ul class="shownFooter">

                <% loop $Menu(1) %>
                    <li>
                        <a href="$Link">$MenuTitle.XML</a>
                    </li>
                <% end_loop %>
            </ul>
            <div class="hiddenFooter">
                <% loop $Menu(1) %>
                    <a href="$Link">$MenuTitle.XML</a><br>
                <% end_loop %>
            </div>
        </nav>
    </div>

    <div>
        <%-- some trickery that had to be done to meet client requirements --%>
        <div class="hiddenFooter">
            <p class="noMarginBottom">$SiteConfig.Location</p>
            <p class="noMargin">$SiteConfig.Street</p>
            <p class="noMargin">$SiteConfig.Postal</p>
            <p class="noMargin">$SiteConfig.Phone</p>
        </div>
        <%-- ------------------------------------------------------------- --%>
        <ul class="shownFooter">
            <li>
                $SiteConfig.Location
            </li>
            <li>
                $SiteConfig.Street
            </li>
            <li>
                $SiteConfig.Postal
            </li>
            <li>
                $SiteConfig.Phone
            </li>
        </ul>
    </div>

    <div>
        <%-- more tricks --%>
        <div class="hiddenFooter">
            <p class="noMarginBottom">$SiteConfig.Prompt:</p>
            <p class="noMargin">$SiteConfig.Email</p>
            <p class="noMargin">Toll Free: $SiteConfig.TollFree</p>
        </div>
        <%-- ----------- --%>
        <ul class="shownFooter">
            <li>
                $SiteConfig.Prompt:
            </li>
            <li>
                $SiteConfig.Email
            </li>
            <li>
                Toll Free: $SiteConfig.TollFree
            </li>
        </ul>
    </div>

    <div>
        <%-- social media links and company logo --%>
        <div class="footerContainer">
            <p>Share</p>
            <a href="#"><img class="mr-half" src="$ThemeDir/images/linkedInWhite.svg" alt="linkedIn logo" width="38.35" height="37.872"></a>
            <a href="#"><img class="mr-half" src="$ThemeDir/images/twitterWhite.svg" alt="twitter logo" width="38.35" height="37.872"></a>
            <a href="#"><img src="$ThemeDir/images/facebookWhite.svg" alt="facebook logo" width="38.35" height="37.872"></a>
        </div>

        <div class="ml-2 mt-2">
            <img src="https://via.placeholder.com/150x100/FFFFFF?text=Company%20Logo" alt="company logo" loading="lazy">
        </div>
    </div>

</footer>
