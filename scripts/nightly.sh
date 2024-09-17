sed -i 's/"name": "xzx-design",/"name": "@xzx-design\/nightly",/' packages/xzx-design/package.json
sed -i '2s/xzx-design/@xzx-design\/nightly/' internal/build-constants/src/pkg.ts
