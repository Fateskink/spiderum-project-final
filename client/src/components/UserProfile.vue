<template>
  <body class="main-body">.
    <main class="user-profile content-fix m-t-15">
        <img src="https://pkmacbook.com/wp-content/uploads/2021/06/anh-bia-facebook-chat-nhat_101825946.jpg" alt="" class="user-bg-img">
        <div class="flex">
            <div class="user-info-and-donate">
                <div class="user-info flex flex-col">
                    <a href=""><img src="https://bangxephang.com/wp-content/uploads/2021/03/100-anh-dai-dien-dep_092340531.jpg" alt="" class="user-avatar"></a>
                    <div class="username">{{currentUser.name}}</div>
                    <div class="userid">{{currentUser.email}}</div>
                    <button>Edit profile</button>
                    <hr>
                    <div class="flex sp-evenly">
                        <div class="flex flex-col">
                            <h2>Followers</h2>
                            <p>100</p>
                        </div>
                        <div class="flex flex-col">
                            <h2>Following</h2>
                            <p>100</p>
                        </div>
                    </div>
                </div>
                <div class="user-donated">
                    <h2>Ủng hộ tác giả tại đây!</h2>
                    <button>Ủng hộ tôi</button>
                </div>
            </div>
            <div class="user-content">
                <div>
                    <ul class="flex flex-gaps-30">
                        <li>Bài viết</li>
                        <li>Bài viết đã lưu</li>
                        <li>Nháp</li>
                    </ul>
                </div>
                <div>
                    
                </div>
            </div>
        </div>
    </main>
</body>
</template>

<script>
import { mapState } from 'vuex'
export default {
 data(){
    return {

    }
 },
 computed: {
    ...mapState(['currentUser'])
 }
}
</script>

<style>

</style>