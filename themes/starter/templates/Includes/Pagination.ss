<%-- NOTE: Before including this, you will need to wrap the include in a with block  --%>

<% if $MoreThanOnePage %>
    <p class="pagination"><%--
        --%><% if $NotFirstPage %><%--
            --%><a class="prev" href="{$PrevLink}" title="Previous Page"><i class="fas fa-fw fa-angle-left"><!-- --></i></a><%--
        --%><% end_if %><%--
    
        --%><% loop $PaginationSummary %><%--
            --%><% if $CurrentBool %><%--
                --%><strong>$PageNum</strong><%--
            --%><% else %><%--
                --%><% if $Link %><%--
                    --%><a href="$Link">$PageNum</a><%--
                --%><% else %><%--
                    --%><span>...</span><%--
                --%><% end_if %><%--
            --%><% end_if %><%--
        --%><% end_loop %><%--
        
        --%><% if $NotLastPage %><%--
            --%><a class="next" href="{$NextLink}" title="Next Page"><i class="fas fa-fw fa-angle-right"><!-- --></i></a><%--
        --%><% end_if %><%--
    --%></p>
<% end_if %>