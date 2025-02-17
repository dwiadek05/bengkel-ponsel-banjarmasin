<?php 
require_once('./../../config.php');
if(isset($_GET['id'])){
$qry = $conn->query("SELECT s.*,cc.category,concat(c.lastname,', ', c.firstname,' ',c.middlename) as fullname,c.email,c.contact, c.address FROM `service_requests` s inner join `categories` cc inner join client_list c on s.client_id = c.id where s.id = '{$_GET['id']}' ");
foreach($qry->fetch_array() as $k => $v){
    $$k = $v;
}
$meta = $conn->query("SELECT * FROM `request_meta` where request_id = '{$id}'");
while($row = $meta->fetch_assoc()){
    ${$row['meta_field']} = $row['meta_value'];
}
}
?>
<style>
    #uni_modal .modal-footer{
        display:none
    }
    span.select2-selection.select2-selection--single,span.select2-selection.select2-selection--multiple {
    padding: 0.25rem 0.5rem;
    min-height: calc(1.5em + 0.5rem + 2px);
    height:auto !important;
    max-height:calc(3.5em + 0.5rem + 2px);
    padding: 0.25rem 0.5rem;
    font-size: 0.875rem;
    border-radius: 0;
}
</style>
<div class="container-fluid">
    <form action="" id="request_form">
        <input type="hidden" name="id" value="<?php echo isset($id) ?  $id : "" ?>">
        <input type="hidden" name="client_id" value="<?php echo isset($client_id) ?  $client_id : "" ?>">
    <div class="col-12">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="owner_name" class="control-label">Nama lengkap pemilik</label>
                    <input type="text" name="" id="owner_name" class="form-control form-control-sm rounded-0" value="<?php echo isset($fullname) ? $fullname : "" ?>" disabled>
                </div>
                <div class="form-group">
                    <label for="contact" class="control-label">No Handphone #</label>
                    <input type="text" name="" id="contact" class="form-control form-control-sm rounded-0" value="<?php echo isset($contact) ? $contact : "" ?>" disabled>
                </div>
                <div class="form-group">
                    <label for="email" class="control-label">Email</label>
                    <input type="email" name="" id="email" class="form-control form-control-sm rounded-0" value="<?php echo isset($email) ? $email : "" ?>" disabled>
                </div>
                <div class="form-group">
                    <label for="address" class="control-label">Alamat</label>
                    <textarea rows="3" name="" id="address" class="form-control form-control-sm rounded-0" style="resize:none" disabled><?php echo isset($address) ? $address : "" ?></textarea>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="vehicle_registration_number" class="control-label">Merk Handphone</label>
                    <input type="text" name="vehicle_registration_number" id="vehicle_registration_number" class="form-control form-control-sm rounded-0" value="<?php echo isset($vehicle_registration_number) ? $vehicle_registration_number : "" ?>" required>
                </div>
                <div class="form-group">
                    <label for="vehicle_model" class="control-label">Model Handphone</label>
                    <input type="text" name="vehicle_model" id="vehicle_model" class="form-control form-control-sm rounded-0" value="<?php echo isset($vehicle_model) ? $vehicle_model : "" ?>" required>
                </div>
                <div class="form-group">
                    <label for="service_id" class="control-label">Service</label>
                    <select name="service_id[]" id="service_id" class="form-select form-select-sm select2 rounded-0" multiple required>
                        <option disabled></option>
                        <?php 
                        $service = $conn->query("SELECT * FROM `service_list` where status = 1 order by `service` asc");
                        while($row = $service->fetch_assoc()):
                        ?>
                        <option value="<?php echo $row['id'] ?>" <?php echo isset($service_id) && in_array($row['id'],explode(",",$service_id))? "selected" : '' ?>><?php echo  $row['service'] ?></option>
                        <?php endwhile; ?>
                    </select>
                </div>
                <div class="form-group">
                    <label for="service_type" class="control-label">Tipe Permintaan</label>
                    <select name="service_type" id="service_type" class="form-select form-select-sm select2 rounded-0" required>
                        <option <?php echo isset($service_type) && $service_type == 'Drop Off' ? "selected" : '' ?>>Datang Langsung</option>
                        <option <?php echo isset($service_type) && $service_type == 'Pick Up' ? "selected" : '' ?>>Kurir</option>
                    </select>
                </div>
                <div class="form-group">
				    <label for="price" class="control-label">Price</label>
                    <input name="price" id="price" type="number" class="form-control rounded-0 text-right" value="<?php echo isset($price) ? $price : 0; ?>" required>
			    </div>
            </div>
        </div>
        <hr class="border-light">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group " id="mechanic-holder">
                    <label for="mechanic_id" class="control-label">Assigned To:</label>
                    <select name="mechanic_id" id="mechanic_id" class="form-select form-select-sm rounded-0" required>
                        <option disabled <?php echo !isset($mechenic_id) || (isset($mechanic_id) && empty($mechanic_id)) ? "selected" : "" ?>></option>
                        <?php 
                        $mechanic = $conn->query("SELECT * FROM `mechanics_list` where status = 1 order by `name` asc");
                        while($row = $mechanic->fetch_assoc()):
                        ?>
                        <option value="<?php echo $row['id'] ?>" <?php echo isset($mechanic_id) && in_array($row['id'],explode(",",$mechanic_id))? "selected" : '' ?>><?php echo  $row['name'] ?></option>
                        <?php endwhile; ?>
                    </select>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="status" class="control-label">Status</label>
                    <select name="status" id="status" class="custom-select custom-select-sm rounded-0" required>
                        <option value="0" <?php echo isset($status) && $status == 0 ? "selected" : '' ?>>Pending</option>
                        <option value="1" <?php echo isset($status) && $status == 1 ? "selected" : '' ?>>Confirmed</option>
                        <option value="2" <?php echo isset($status) && $status == 2 ? "selected" : '' ?>>On-Progress</option>
                        <option value="3" <?php echo isset($status) && $status == 3 ? "selected" : '' ?>>Done</option>
                        <option value="4" <?php echo isset($status) && $status == 4 ? "selected" : '' ?>>Cancelled</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
        <div class="w-100 d-flex justify-content-end mx-2">
            <div class="col-auto">
                <button class="btn btn-primary btn-sm rounded-0">Save Request</button>
                <button class="btn btn-light btn-sm rounded-0" type="button" data-dismiss="modal">Close</button>
            </div>
        </div>
    </form>
</div>
<script>
    $(function(){
        $('.select2').select2({
            placeholder:"Please Select Here",
            dropdownParent: $('#uni_modal')
        })
        $('#mechanic_id').select2({
            placeholder:"Please Select Here",
            dropdownParent: $('#mechanic-holder')
        })
        $('#request_form').submit(function(e){
            e.preventDefault()
            start_loader();
            $.ajax({
                url:_base_url_+'classes/Master.php?f=save_request',
                method:'POST',
                data:$(this).serialize(),
                dataType:'json',
                error:err=>{
                    console.log(err)
                    alert_toast("An error occured",'error');
                    end_loader()
                },
                success:function(resp){
                    end_loader()
                    if(resp.status == 'success'){
                        alert_toast("Data successfully saved",'success');
                        setTimeout(() => {
                            uni_modal("Service Request Details","service_requests/view_request.php?id="+resp.id,'large')
                            $('#uni_modal').on('hidden.bs.modal',function(){
                                location.reload()
                            })
                        }, 200);
                    }else{
                        alert_toast("An error occured",'error');
                    }
                }
            })
        })
    })
</script>