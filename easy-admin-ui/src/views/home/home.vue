<script setup lang="ts">
import {computed, ref} from 'vue'
import {useRouter} from 'vue-router'
import VChart from 'vue-echarts'
import {use} from 'echarts/core'
import {CanvasRenderer} from 'echarts/renderers'
import {LineChart} from 'echarts/charts'
import {GridComponent, TitleComponent, TooltipComponent} from 'echarts/components'
import {ArrowRight, Calendar, Coin, Document, Grid, Message, Setting, User} from '@element-plus/icons-vue'

// 注册 ECharts 组件
use([
  CanvasRenderer,
  LineChart,
  TitleComponent,
  TooltipComponent,
  GridComponent
])

const router = useRouter()

// 统计数据
const statistics = ref([
  {title: '用户总数', value: 128, icon: User, color: '#409EFF', key: 'users'},
  {title: '数据库配置', value: 24, icon: Coin, color: '#67C23A', key: 'databases'},
  {title: '系统菜单', value: 56, icon: Grid, color: '#E6A23C', key: 'menus'},
  {title: '操作记录', value: 1024, icon: Document, color: '#F56C6C', key: 'logs'}
])

// 功能模块
const modules = ref([
  {name: '用户管理', icon: User, color: '#409EFF', path: '/system/user', desc: '管理系统用户账号'},
  {name: '数据库配置', icon: Coin, color: '#67C23A', path: '/system/db', desc: '配置数据库连接'},
  {name: '权限管理', icon: Setting, color: '#E6A23C', path: '/system/permission', desc: '配置用户权限'},
  {name: '菜单管理', icon: Grid, color: '#F56C6C', path: '/system/menu', desc: '管理系统菜单'},
  {name: '字典管理', icon: Document, color: '#909399', path: '/system/dict', desc: '管理数据字典'},
  {name: '消息中心', icon: Message, color: '#00d4ff', path: '/message/center', desc: '系统消息通知'}
])

// 最近操作记录
const recentOperations = ref([
  {user: 'admin', action: '创建用户', target: '用户:张三', time: '2分钟前', type: 'success'},
  {user: 'admin', action: '修改配置', target: '数据库:MySQL-Test', time: '15分钟前', type: 'warning'},
  {user: 'user1', action: '登录系统', target: 'IP:192.168.1.100', time: '30分钟前', type: 'info'},
  {user: 'admin', action: '删除菜单', target: '菜单:测试菜单', time: '1小时前', type: 'danger'},
  {user: 'user2', action: '导出数据', target: '用户列表', time: '2小时前', type: 'success'},
  {user: 'admin', action: '更新权限', target: '角色:普通用户', time: '3小时前', type: 'warning'}
])

// 系统信息
const systemInfo = ref({
  name: 'Easy-Do 管理系统',
  version: 'v1.0.0',
  author: 'Easy-Do Team',
  framework: 'Vue 3 + Element Plus',
  database: 'MySQL',
  updateTime: '2026-04-17'
})

// 图表配置 - 使用 computed 自动响应
const chartOption = computed(() => ({
  title: {
    text: '系统访问趋势',
    left: 'center',
    textStyle: {
      fontSize: 16,
      fontWeight: 'normal'
    }
  },
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross'
    }
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  xAxis: {
    type: 'category',
    boundaryGap: false,
    data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: '访问量',
      type: 'line',
      smooth: true,
      areaStyle: {
        color: {
          type: 'linear',
          x: 0,
          y: 0,
          x2: 0,
          y2: 1,
          colorStops: [
            {offset: 0, color: 'rgba(64, 158, 255, 0.5)'},
            {offset: 1, color: 'rgba(64, 158, 255, 0.1)'}
          ]
        }
      },
      lineStyle: {
        color: '#409EFF',
        width: 2
      },
      itemStyle: {
        color: '#409EFF'
      },
      data: [820, 932, 901, 1234, 1290, 1330, 1420]
    },
    {
      name: '操作次数',
      type: 'line',
      smooth: true,
      areaStyle: {
        color: {
          type: 'linear',
          x: 0,
          y: 0,
          x2: 0,
          y2: 1,
          colorStops: [
            {offset: 0, color: 'rgba(103, 194, 58, 0.5)'},
            {offset: 1, color: 'rgba(103, 194, 58, 0.1)'}
          ]
        }
      },
      lineStyle: {
        color: '#67C23A',
        width: 2
      },
      itemStyle: {
        color: '#67C23A'
      },
      data: [620, 732, 701, 934, 1090, 1130, 1220]
    }
  ]
}))

// 跳转到功能模块
const navigateTo = (path: string) => {
  router.push(path)
}
</script>

<template>
  <div class="home-container">
    <!-- 统计卡片区域 -->
    <el-row :gutter="20" class="statistics-row">
      <el-col :xs="24" :sm="12" :md="6" v-for="item in statistics" :key="item.key">
        <el-card class="statistic-card" shadow="hover">
          <div class="statistic-content">
            <div class="statistic-icon" :style="{ backgroundColor: item.color + '20' }">
              <el-icon :size="32" :color="item.color">
                <component :is="item.icon"/>
              </el-icon>
            </div>
            <div class="statistic-info">
              <div class="statistic-value">{{ item.value }}</div>
              <div class="statistic-title">{{ item.title }}</div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 图表区域 -->
    <el-row :gutter="20" class="chart-row">
      <el-col :span="24">
        <el-card class="chart-card" shadow="hover">
          <v-chart
              :option="chartOption"
              :autoresize="true"
              style="width: 100%; height: 350px;"
          />
        </el-card>
      </el-col>
    </el-row>

    <!-- 功能模块和操作记录 -->
    <el-row :gutter="20" class="content-row">
      <!-- 功能模块 -->
      <el-col :xs="24" :lg="14">
        <el-card class="module-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span class="card-title">
                <el-icon><Grid/></el-icon>
                功能模块
              </span>
            </div>
          </template>
          <div class="module-grid">
            <div
                v-for="module in modules"
                :key="module.name"
                class="module-item"
                @click="navigateTo(module.path)"
            >
              <div class="module-icon" :style="{ backgroundColor: module.color + '15' }">
                <el-icon :size="28" :color="module.color">
                  <component :is="module.icon"/>
                </el-icon>
              </div>
              <div class="module-info">
                <div class="module-name">{{ module.name }}</div>
                <div class="module-desc">{{ module.desc }}</div>
              </div>
              <el-icon class="module-arrow" :size="16">
                <ArrowRight/>
              </el-icon>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 系统信息 -->
    <el-row :gutter="20" class="system-row">
      <el-col :span="24">
        <el-card class="system-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span class="card-title">
                <el-icon><Setting/></el-icon>
                系统信息
              </span>
            </div>
          </template>
          <div class="system-info-grid">
            <div class="system-info-item">
              <span class="system-label">系统名称：</span>
              <span class="system-value">{{ systemInfo.name }}</span>
            </div>
            <div class="system-info-item">
              <span class="system-label">系统版本：</span>
              <span class="system-value">{{ systemInfo.version }}</span>
            </div>
            <div class="system-info-item">
              <span class="system-label">开发团队：</span>
              <span class="system-value">{{ systemInfo.author }}</span>
            </div>
            <div class="system-info-item">
              <span class="system-label">技术栈：</span>
              <span class="system-value">{{ systemInfo.framework }}</span>
            </div>
            <div class="system-info-item">
              <span class="system-label">数据库：</span>
              <span class="system-value">{{ systemInfo.database }}</span>
            </div>
            <div class="system-info-item">
              <span class="system-label">更新时间：</span>
              <span class="system-value">
                <el-icon><Calendar/></el-icon>
                {{ systemInfo.updateTime }}
              </span>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<style scoped lang="scss">
.home-container {
  padding: 20px;
  background-color: #f5f7fa;
  min-height: calc(100vh - 60px);
}

// 统计卡片样式
.statistics-row {
  margin-bottom: 20px;
}

.statistic-card {
  margin-bottom: 20px;

  .statistic-content {
    display: flex;
    align-items: center;
    padding: 10px;

    .statistic-icon {
      width: 64px;
      height: 64px;
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 16px;
    }

    .statistic-info {
      flex: 1;

      .statistic-value {
        font-size: 28px;
        font-weight: bold;
        color: #303133;
        line-height: 1.2;
      }

      .statistic-title {
        font-size: 14px;
        color: #909399;
        margin-top: 4px;
      }
    }
  }
}

// 图表卡片样式
.chart-card {
  margin-bottom: 20px;
}

// 内容区域
.content-row {
  margin-bottom: 20px;
}

// 功能模块卡片
.module-card {
  margin-bottom: 20px;

  .module-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
    gap: 16px;

    .module-item {
      display: flex;
      align-items: center;
      padding: 16px;
      border-radius: 8px;
      background-color: #fafafa;
      cursor: pointer;
      transition: all 0.3s;

      &:hover {
        background-color: #f0f7ff;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);

        .module-arrow {
          transform: translateX(4px);
        }
      }

      .module-icon {
        width: 48px;
        height: 48px;
        border-radius: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 12px;
        flex-shrink: 0;
      }

      .module-info {
        flex: 1;

        .module-name {
          font-size: 15px;
          font-weight: 500;
          color: #303133;
          margin-bottom: 4px;
        }

        .module-desc {
          font-size: 12px;
          color: #909399;
        }
      }

      .module-arrow {
        color: #c0c4cc;
        transition: transform 0.3s;
      }
    }
  }
}

// 操作记录卡片
.operation-card {
  margin-bottom: 20px;

  .operation-list {
    max-height: 400px;
    overflow-y: auto;

    .operation-item {
      display: flex;
      align-items: flex-start;
      padding: 12px 0;
      border-bottom: 1px solid #f0f0f0;

      &:last-child {
        border-bottom: none;
      }

      .operation-dot {
        width: 8px;
        height: 8px;
        border-radius: 50%;
        margin-top: 6px;
        margin-right: 12px;
        flex-shrink: 0;

        &.success {
          background-color: #67C23A;
        }

        &.warning {
          background-color: #E6A23C;
        }

        &.info {
          background-color: #909399;
        }

        &.danger {
          background-color: #F56C6C;
        }
      }

      .operation-content {
        flex: 1;

        .operation-main {
          font-size: 14px;
          margin-bottom: 4px;

          .operation-user {
            color: #409EFF;
            font-weight: 500;
          }

          .operation-action {
            color: #606266;
            margin-left: 8px;
          }
        }

        .operation-detail {
          font-size: 12px;
          color: #909399;

          .operation-target {
            margin-right: 12px;
          }

          .operation-time {
            color: #c0c4cc;
          }
        }
      }
    }
  }
}

// 系统信息卡片
.system-card {
  .system-info-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 16px;

    .system-info-item {
      padding: 12px 16px;
      background-color: #fafafa;
      border-radius: 6px;

      .system-label {
        color: #909399;
        font-size: 14px;
      }

      .system-value {
        color: #303133;
        font-size: 14px;
        font-weight: 500;
        display: inline-flex;
        align-items: center;
        gap: 4px;

        .el-icon {
          vertical-align: middle;
        }
      }
    }
  }
}

// 卡片头部样式
.card-header {
  display: flex;
  align-items: center;
  justify-content: space-between;

  .card-title {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 16px;
    font-weight: 500;
    color: #303133;
  }
}

// 响应式调整
@media (max-width: 768px) {
  .home-container {
    padding: 10px;
  }

  .module-grid {
    grid-template-columns: 1fr !important;
  }

  .system-info-grid {
    grid-template-columns: 1fr !important;
  }
}
</style>
