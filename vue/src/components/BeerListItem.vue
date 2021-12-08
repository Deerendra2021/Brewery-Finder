<template>
  <div>
    <div class="card text-primary bg-danger mb-3" style="width: 18rem">
      <div class="card-body">
        <h5 class="card-title">{{ beer.name }}</h5>
        <small>{{ beer.abv }} ABV</small>
        <h6 class="card-subtitle mb-2 text-muted">{{ beer.style }}</h6>
        <p class="card-text">{{ beer.availability }}</p>
        <a href="#" class="card-link">Card link</a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
    props: {
        beer: Object,
    },
};
</script>

<style>

</style>