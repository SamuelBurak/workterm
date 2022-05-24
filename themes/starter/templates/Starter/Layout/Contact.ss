<%-- title for content which will be inside banner --%>
<h1 class="title">$SemiTitle</h1>

<%-- css semicircle to be displayed under banner --%>
<div class="semicircle"></div>

<% with $Photo %>
    <picture>
        <source srcset="$URL" media="(min-width: 800px)" loading="lazy" alt="$Top.PhotoAlt" width="1146" height="680" >
        <img class="contactImage" src="$WebP.URL" loading="lazy" alt="$Top.PhotoAlt" width="1146" height="680" />
    </picture>
<% end_with %>

<%-- Prompt --%>
<h2 class="bold mt-3 alignCenter">$Prompt</h2>

<%-- Begin Main Content --%>
<main class="myContainer wrap gap-5 justifyCenter">
    <div>
        <p class="noMargin">$Content</p>
    </div>

    <%-- Contact Form --%>
    <div class="centerButton">
        <form action="">
            <label for="flName">First and Last Name</label>
            <input type="text" name="flName" >

            <label for="email">Email</label>
            <input type="email" name="email">

            <label for="phone">Phone</label>
            <input type="tel" name="phone">

            <label for="message">Questions or comments</label>
            <textarea type="textarea" name="message"></textarea>
        </form>

        <button type="submit" class="roundedSubmit">Submit</button>
    </div>
</main>
