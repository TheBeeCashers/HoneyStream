<template>
  <div id="header">
    <div class="search-box">
      <input type="text" class="search-field" placeholder="Search..." />
    </div>

    <div class="icons">
      <router-link to="/upload">Upload</router-link>
    </div>
  </div>
</template>

<style scoped lang="scss">
#header {
  padding: 10px 20px;
  border-bottom: solid 1px #ececec;
  display: flex;
  flex-direction: row;
  align-items: center;

  .search-box {
    flex: 1;
    text-align: center;
    
    .search-field {
      padding: 10px;
      width: 200px;
      transition: width .2s;
      outline: none;
      border-radius: 4px;
      border: solid 1px #ececec;

      &:focus {
        width: 300px;
        border-color: #ddd;
      }
    }
  }

  .icons {
    a {
      color: #efa348;
      text-decoration: none;
      font-weight: bold;
      transition: .2s;

      &:hover {
        color: #efca60;
      }
    }
  }
}

</style>