<%-- image with overlay and text --%>
<div class="overlay" >
    <nav class="menuContainer">
        <div class="flexGrow">
            <img class="autoWidthHeight autoMargin" src="https://via.placeholder.com/150x100/000000?text=Company%20Logo" alt="company logo">
        </div>
        <div>
            <i class="fas fa-search p-60p open-button"></i>
            <% if $SearchForm %>
                $SearchForm
            <% end_if %>
            <a href="#" id="mobile-menu-trigger" title="Menu"><i class="fas fa-bars"></i></a>
        </div>
    </nav>
    <% with $Banner %>
        <picture>
            <source srcset="$Fill(1920,1080).WebP.URL" media="(min-width: 800px)" loading="lazy" width="1920" height="1080" >
            <img src="$Fill(1920,1080).WebP.URL" alt="$Top.BannerAlt" loading="lazy" width="1920" height="1080" />
        </picture>
    <% end_with %>
    <h2 class="banner-text">$Title.LimitCharactersToClosestWord(50, '...')</h2>
</div>
