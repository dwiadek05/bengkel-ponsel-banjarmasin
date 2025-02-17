<div class="card card-outline card-dark shadow rounded-0">
    <div class="card-header">
        <h3 class="card-title"><b>Order List</b></h3>
    </div>
    <div class="card-body">
        <div class="container-fluid">
            <table class="table table-stripped table-bordered">
                <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="15%">
                    <col width="15%">
                    <col width="20%">
                    <col width="15%">
                    <col width="15%">
                </colgroup>
                <thead>
                    <tr class="bg-gradient-dark text-light">
                        <th class="text-center">#</th>
                        <th class="text-center">Date Ordered</th>
                        <th class="text-center">Ref. Code</th>
                        <th class="text-center">Client</th>
                        <th class="text-center">Total Amount</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    $i = 1;
                    $orders = $conn->query("SELECT o.*,concat(c.firstname,' ',c.middlename,' ',c.lastname) as fullname FROM `order_list` o inner join client_list c on o.client_id = c.id order by o.status asc, unix_timestamp(o.date_created) desc ");
                    while($row = $orders->fetch_assoc()):
                    ?>
                        <tr>
                            <td class="text-center"><?= $i++ ?></td>
                            <td><?= date("Y-m-d H:i", strtotime($row['date_created'])) ?></td>
                            <td><?= $row['ref_code'] ?></td>
                            <td><?= $row['fullname'] ?></td>
                            <td class="text-right"><?= number_format($row['total_amount'],2) ?></td>
                            <td class="text-center">
                                <?php if($row['status'] == 0): ?>
                                    <span class="badge badge-secondary px-3 rounded-pill">Pending</span>
                                <?php elseif($row['status'] == 1): ?>
                                    <span class="badge badge-primary px-3 rounded-pill">Packed</span>
                                <?php elseif($row['status'] == 2): ?>
                                    <span class="badge badge-success px-3 rounded-pill">For Delivery</span>
                                <?php elseif($row['status'] == 3): ?>
                                    <span class="badge badge-warning px-3 rounded-pill">On the Way</span>
                                <?php elseif($row['status'] == 4): ?>
                                    <span class="badge badge-default bg-gradient-teal px-3 rounded-pill">Delivered</span>
                                <?php else: ?>
                                    <span class="badge badge-danger px-3 rounded-pill">Cancelled</span>
                                <?php endif; ?>
                            </td>
                            <td class="text-center">
                                <a class="btn btn-flat btn-sm btn-default border view_data" href="./?page=orders/view_order&id=<?= $row['id'] ?>" data-id="<?= $row['id'] ?>"><i class="fa fa-eye"></i> View</a>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(function(){

        $('.table th, .table td').addClass("align-middle px-2 py-1")
		$('.table').dataTable();
		$('.table').dataTable();
    })
</script>