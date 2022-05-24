<% cached 'mainMenu', $ID, $SiteConfig.LastEdited, $List('SilverStripe\CMS\Model\SiteTree').Max('LastEdited'), $LastEdited, $current_stage %>
    <div class="menuwrapper">
        <div class="menu-close <% if $CurrentSegment %>$CurrentSegment.LowerCase<% end_if %>">
            <button class="close" title="Close Menu"><i class="fas fa-times"></i></button>
        </div>
        <nav aria-label='primary'>
            <ul class="menu-bar">

                <%-- looping through the menu for nav links --%>
                <% loop $Menu(1) %>
                    <li>
                        <a href="$Link" class="$LinkingMode<% if $Children %> menu<% end_if %>"><span>$MenuTitle.XML.LimitCharactersToClosestWord(10)</span></a>
                        <% if $Children %>
                            <button class="open-child" title="$MenuTitle.ATT Sub-Menu"><i class="fas fa-chevron-down"></i></button>

                            <ul>
                                <% loop $Children %>
                                    <li>
                                        <a href="$Link" class="$LinkingMode">$MenuTitle.XML.LimitCharactersToClosestWord(10)</a>

                                        <% if $Children %>
                                            <button class="open-child" title="$MenuTitle.ATT Sub-Menu"><i class="fas fa-chevron-down"></i></button>

                                            <ul>
                                                <% loop $Children %>
                                                    <li>
                                                        <a href="$Link" class="$LinkingMode">$MenuTitle.XML.LimitCharactersToClosestWord(10)</a>
                                                    </li>
                                                <% end_loop %>
                                            </ul>
                                        <% end_if %>
                                    </li>
                                <% end_loop %>
                            </ul>
                        <% end_if %>
                    </li>
                <% end_loop %>
                <%-- don't show if mobile view --%>
                <li class="open-button mobileNavHide">
                   <i class="fas fa-search p-60p"></i>
                </li>
                <% if $SearchForm %>
                    <li class="mobileNavHide">
                        $SearchForm
                    </li>
                <% end_if %>
            </ul>
        </nav>
    </div>
<% end_cached %>
