<template>
  <div class="beerCards card-deck">
    <div class="card text-primary bg-info mb-3 text-center" style="width: 25rem">
      <div class="card-body">
          <img src="../img/BeerIcon.png" alt="Beer Icon" class="beerIcon" />
        <h5 class="card-title">{{ beer.name }}</h5>
        <small v-if="beer.abv != ''">{{ beer.abv }} ABV</small>
        <h6 class="card-subtitle mb-2 text-muted">{{ beer.style }}</h6>
        <p class="card-text">{{ beer.availability }}</p>
        <router-link tag="a" class="card-link"
          v-bind:to="{name: 'BeerDetails', params: {id: beer.id} }">
            Beer Details
        </router-link>
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

.beerIcon {
    max-width: 70px;
    max-height: auto;
    float: left;
    
}

.card {
  opacity: .7;
  text-align: center;
}

</style>