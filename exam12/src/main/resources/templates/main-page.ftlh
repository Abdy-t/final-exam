<#import "partials/main.ftlh" as main />
<#import "partials/pager.ftlh" as p />

<@main.renderWith>
    <div class="third-block container">
        <h3>All cafes</h3>
<#--        <#if page??>-->
         <div class="row">
            <#list page.content as cafe>
                <div class="card mb-3">
                    <img src="images/java123.jpg" class="card-img-top" alt="111">

<#--                    <#list cafe.images as image>-->
<#--&lt;#&ndash;                        <img src="${image.path}" class="card-img-top" alt="...">&ndash;&gt;-->
<#--                    </#list>-->
                    <div class="card-body">
                        <a href="#" class="btn" style="background-color: #1d9fbd">graphics</a>
                        <h5 class="card-title">${cafe.title}</h5>
                        <p>${cafe.rating}</p>
                    </div>
                </div>
            </#list>
         </div>
    </div>
    <@p.pager url page />


</@main.renderWith>