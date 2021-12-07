<template>
    <div>
        <div class="card text-primary bg-dark mb-3" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">{{brewery.name}}</h5>
                <h6 class="card-subtitle mb-2 text-muted">{{brewery.address1}}</h6>
                <p class="card-text">{{brewery.description}}</p>
                <a href="#" class="card-link">Card link</a>
            </div>
        </div>

        <div class="list-group">
            <a href="#" class="list-group-item list-group-item-action active">
                <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">{{brewery.name}}</h5>
                <small>{{brewery.city}}</small>
                </div>
                <p class="mb-1">{{brewery.description}}</p>
                <small>{{brewery.address1}}</small>
            </a>
        </div>
    </div>

</template>

<script>
export default {
     props: {
        brewery: Object,
    },

}
</script>

<style>

</style>