
DROP POLICY IF EXISTS "Authenticated can list site assets" ON storage.objects;

CREATE POLICY "Admins can list site assets"
ON storage.objects FOR SELECT
TO authenticated
USING (bucket_id = 'site-assets' AND public.has_role(auth.uid(), 'admin'));

REVOKE EXECUTE ON FUNCTION public.has_role(uuid, app_role) FROM authenticated;
