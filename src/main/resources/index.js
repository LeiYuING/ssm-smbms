import { createRouter, createWebHistory } from 'vue-router'
import Find from '../views/FindMusic.vue'
import recommend from '../views/Recommend.vue'

const routes = [
  {
    path: '/',
    component: Find,
    //二级路由
    children:[
      {
        path: '/',
        component: recommend,
      },
      {
        path: '/rank',
        component: () => import(/* webpackChunkName: "about" */ '../views/Rank.vue')
      },
      {
        path: '/songs',
        component: () => import(/* webpackChunkName: "about" */ '../views/Songs.vue')
      }
    ]
  },
  {
    path: '/my',
    component: () => import(/* webpackChunkName: "about" */ '../views/MyMusic.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
