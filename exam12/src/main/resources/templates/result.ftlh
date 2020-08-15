<#import "partials/main.ftlh" as main />

<@main.renderWith>
    <div class="third-block container">
        <div class="container mb-5">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <#if result??>
                <div class="card mb-3">
                    <#list result as cafe>
<#--                        <img src="/images/java123.jpg" class="card-img-top" style="width:  100px">-->
                        <p>${cafe.title}</p>
                        <div class="card mb-3">
                            <img src="${cafe.image}" class="card-img-top" alt="..." style="width:  150px">
                            <div class="card-body">
                                <a href="/cafe/${cafe.id}" class="btn" style="background-color: #1d9fbd"><h5 class="card-title">${cafe.title}</h5></a>
                                <p>Rating-${cafe.rating}</p>
                                <p>Reviews-${cafe.reviewsCount} Photos-${cafe.imagesCount}</p>
                            </div>
                        </div>
                    </#list>
                </div>
            </#if>
        </div>
    </div>
</@main.renderWith>