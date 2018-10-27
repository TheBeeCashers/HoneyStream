<template>
  <div id="header">
    <div class="search-box">
      <input type="text" class="search-field" placeholder="Search..." />
    </div>

    <div class="icons">
      <img src="https://www.svgrepo.com/show/12324/cloud-uploading-arrow.svg" />
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
    height: 20px;

    img {
      height: 20px;
    }
  }
}

</style>