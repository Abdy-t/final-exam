<#import "partials/main.ftlh" as main />

<@main.renderWith>
    <div class="third-block container">
        <div class="container mb-5">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <#if cafe??>
                <div class="card mb-3">
                    <h3>${cafe.title}</h3>
<#--                    <img src="/images/java123.jpg" class="card-img-top" style="width:  300px">-->
<#--                    <img src="${cafe.image}" class="card-img-top" alt="...">-->
                    <div class="card-body">
                        <img src="/images/java123.jpg" class="card-img-top" style="width:  300px">
                        <#if images??>
                            <#list images as image>
                                <img src="/images/java123.jpg" class="card-img-top" style="width:  100px">
                            </#list>
                        </#if>
                        <h4 style="color: #0f6674">Description</h4>
                        <h5>${cafe.description}</h5>
                        <h4 style="color: #0f6674">Rating</h4>
                        <p>${cafe.rating}</p>
                    </div>
                </div>
            </#if>
            <#if reviews??>
                <#list reviews as review>
                    <div style="text-align: left">
                        <h4>On ${review.date} ${review.user_name} said:</h4>
                        <h5>${review.text}</h5>
                        <h4>${review.rating}</h4>
                    </div>
                    <#if review.user_name == user.email>
                        <div style="text-align: left">
                            <form action="/deleteReview" method="post">
                                <input type="hidden" name="cafe_id" value="${cafe.id}">
                                <input type="hidden" name="review_id" value="${review.id}">
                                <button type="submit"> Delete</button>
                            </form>
                        </div>
                    </#if>
                </#list>
            </#if>
            <h4>Add review</h4>
            <form action="/addReview" method="post" style="width: 50%; margin-left: auto; margin-right: auto" enctype="multipart/form-data">
                <div class="form-group">
                    <input name="cafe_id" type="hidden" class="form-control" id="cafe_id" value="${cafe.id}">
                    <label for="review">Description</label>
                    <textarea name="review" type="text" class="form-control" id="description" required autofocus></textarea>
                    <select size="5" name="rating" required>
                        <option disabled>Choice a number for the rating</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                    <button type="submit" class="send btn btn-secondary">Add</button>
                </div>
            </form>
            <form action="/addCafes" method="post" style="width: 50%; margin-left: auto; margin-right: auto" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">Cafe</label>
                    <input name="title" type="text" class="form-control" id="title"  placeholder="Cafe title" required autofocus>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <input name="description" type="text" class="form-control" id="description"  placeholder="Cafe title" required autofocus>
                </div>
                <div class="form-group">
                    <label for="image">Image</label>
                    <input name="image" type="file" class="form-control" id="image"  placeholder="Cafe title" required autofocus>
                </div>
                <button type="submit" class="send btn btn-secondary">Add</button>
            </form>
        </div>
    </div>
</@main.renderWith>