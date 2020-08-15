<#import "partials/main.ftlh" as main />
<#import "partials/pager.ftlh" as p />

<@main.renderWith>
    <div class="third-block container">
        <h3>All cafes</h3>
        <#if _csrf??>
            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
        </#if>

         <div class="row">
            <#list page.content as cafe>
                <div class="card mb-3">
                    <img src="/images/java123.jpg" class="card-img-top" style="width:  100px">
                    <img src="${cafe.image}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <a href="/cafe/${cafe.id}" class="btn" style="background-color: #1d9fbd"><h5 class="card-title">${cafe.title}</h5></a>
                        <p>Rating-${cafe.rating}</p>
                        <p>Reviews-${cafe.reviewsCount} Photos-${cafe.imagesCount}</p>
                    </div>
                </div>
            </#list>
         </div>
    </div>
    <@p.pager url page />


</@main.renderWith>