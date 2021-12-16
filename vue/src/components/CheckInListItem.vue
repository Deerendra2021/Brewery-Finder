<template>
  <table class="table">
    <thead>
        <tr>
            <th scope="col">Brewery Visited</th>
            <th scope="col">Timestamp</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>{{checkIn.breweryName}}</td>
            <td>{{checkIn.dateTime}}</td>
        <tr>    
    </tbody>
  </table>
</template>

<script>
export default {
    props: {
        checkIn: Object,
    }

}
</script>

<style>

</style>