# vendor_malachite-extras

Malachite Parts, Xiaomi CIT and the Goodix FOD test app for POCO X7 5G (malachite), plus the `malachited` helper that lets Parts change kernel settings on user builds without su.

## Use it
1. Add `.repo/local_manifests/malachite-extras.xml`:

    <manifest>
      <remote name="FMIUI" fetch="https://github.com/FMIUI" />
      <project path="vendor/malachite-extras" name="vendor_malachite-extras" remote="FMIUI" revision="main" />
    </manifest>

2. `repo sync`, then from the source root: `vendor/malachite-extras/integrate.sh device/xiaomi/malachite`
3. Build. APKs are re-signed with your ROM's platform key.

Device-tree maintainers can instead list it in their `*.dependencies` file:

    { "repository": "FMIUI/vendor_malachite-extras", "target_path": "vendor/malachite-extras", "remote": "github" }

Only works on malachite. The sepolicy and nodes are device specific.
